Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC20EC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 21:17:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8455F23B88
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 21:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8455F23B88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uHwsu3gp6zie8vxVReeI5T99LvmPyELQSfthjLpKewk=; b=tgooTuosIdcmRlFY5QVcPM1mK
	0CUOxNIONVYXhusSPl8ifenKwPlepl/Uzccm77Uhda3PXzPIr8TVkc8TxdHinLEogZFP7DiNwmckr
	E9K5Or3+1b1E2QpjQcQDJODEFP+1ArK9BNPQ0kb9JDqMCt56qiZ3M5xMrk7dM3U8/iF/Ah+T2VK99
	eSgYDDF7vIvTNCmY08sMuTMM0YOl0duFt7ONkzQyVwiKyo+gLV85gew8V7Y3LSoOVRpDNIUpDJFs7
	/MV+YP9uHDR+DPqK/eBRtgA3bvreLw78/3F6NzPuB3b0NAJMJCm+5PEB9eyjqYuuhXFIRXConjktT
	kPn0Tz25A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqN7Y-0005Rc-MH; Fri, 18 Dec 2020 21:17:04 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqN7U-0005QH-3G; Fri, 18 Dec 2020 21:17:00 +0000
Received: by mail-ot1-f52.google.com with SMTP id d8so3263893otq.6;
 Fri, 18 Dec 2020 13:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oZbLTUAj2Ubj95CZHG22KJrmm6gu+1PJrDH8jQ0Wy2w=;
 b=F/bxvbAKCkiADrkJpykiW0rNjhqbi8v3+DjNws1UoLE1Q4rWcMJn+JV9Pgz8YZ09f8
 dO1uuyS3aOplv8GhShLrPDRahF7fnlUXQpfJ5eEGBF6rddpY7cKebiRL0nLWYy/fK/yO
 vbF15EYgkMhJuzVY2WjFpHLIKBj0w9tMwNikPzxIJn7JfLdcQGqGvn5gpshH3Cji/OCD
 RNL20T2Qxzh8cWXqQ5/PaZH7JIqVRJPT0+Zak6NCyILDB7cm+YhYNqUabQK6PPVu8ISR
 zRWAvDe7Li1i+B5t2NXv9hzNUY1RuzXrONKF+dKD9CIxRQdLvNrlJsYQtHPe5jsxe1ky
 e5Cg==
X-Gm-Message-State: AOAM531GogGbzd8rS48FRgfUdFF4qYA0+E+Z1/bnGbDA451ztQmi0GkV
 qe/dlXze1neQxm6W+td1nw==
X-Google-Smtp-Source: ABdhPJy9XYh7zJVONvvuBjyhbfwsYX4hbZey5qNYAdiUHfr1I2nThQ60ynXf75brR04s/jCIn1yfaQ==
X-Received: by 2002:a9d:745a:: with SMTP id p26mr4383657otk.206.1608326219050; 
 Fri, 18 Dec 2020 13:16:59 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y84sm2078765oig.36.2020.12.18.13.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 13:16:58 -0800 (PST)
Received: (nullmailer pid 2190306 invoked by uid 1000);
 Fri, 18 Dec 2020 21:16:57 -0000
Date: Fri, 18 Dec 2020 15:16:57 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 2/5] dt-bindings: serial: add the required property
 'additionalProperties'
Message-ID: <20201218211657.GA2190041@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-3-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_161700_233946_396EDB35 
X-CRM114-Status: GOOD (  12.68  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Karol Gugala <kgugala@antmicro.com>,
 Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stafford Horne <shorne@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 04 Dec 2020 17:38:10 +0800, Zhen Lei wrote:
> When I do dt_binding_check for any YAML file, below wanring is always
> reported:
> 
> xxx/serial/litex,liteuart.yaml: 'additionalProperties' is a required property
> xxx/serial/litex,liteuart.yaml: ignoring, error in schema:
> warning: no schema found in file: xxx/serial/litex,liteuart.yaml
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/serial/litex,liteuart.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
