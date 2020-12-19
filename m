Return-Path: <SRS0=cDU4=FX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7021DC4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 09:28:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0126623BE2
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 09:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0126623BE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hey7e/Ok+3MXP4QekUHqB2DWfGbFt5yCq5sVuD+M9mg=; b=raZEVGHeNVhXu4R2N1hDpBvnZ
	xJUvedn6vGZYBEZj9l+MtBM6O+4mWYvFNnkqqGSsadQwT5xI6mf9X2HE1/rHnjhqaAlIYXp/g3tCz
	i0Pwcne+AiEf9gZR1NXMhzI+zgG++7Hy1XiPPeeu1+52u4tziR2Ts2lL/pqK96cHnblJA3KixgS3X
	QzvLgKDz3TqshrsTopF66UAeU3vlJeBet0RbfvS0qBNeMp5daZvDn1WgUKdBOMTQ9o1kNl+y0ub6y
	RXVYdZPrVqhwZQCiORN/yfcNIilGCv2Oy8vyo+yesTbbW1pFIcV0DttsppvzIUnuYTfqIFv29dEwA
	uNIveToTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqYWv-00024H-IH; Sat, 19 Dec 2020 09:28:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqYWt-00023W-1e; Sat, 19 Dec 2020 09:28:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id q22so3016732pfk.12;
 Sat, 19 Dec 2020 01:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ctmRMSbwSXsaUJmiSd13cerYbuM3368cFgF1ybIbnTk=;
 b=TJAl+FrXpE9DBSVN6HlpabGbK1T5ePXYs0WRG220mm555kBJcqf2uiFcVg3T7VaSGT
 LQRfLBrNHh/aIt+fc1XuNI/sRDVQV1Y3KP95RaJDRVSk50P0NEFcEK4r9rleQFjV117a
 hrr3pBCTPsyip+3lKtfsvF/xP1jJH43EjsTWQjQmVY8HZz4ioQxJVvLsB550cgnPA9lp
 jexkeuw/XqO4ULcgY2XV1V6gAEl52d95gftoIhuPgDBYYlZggN+CvMvzBzV4D2FX+xrm
 sQyq8N0lYFVlXT/MQlNlKnWArV+pS5YXkwKRo8GPI1Ib19T2H+YIsGd+FizMJrl5Sv2k
 s4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ctmRMSbwSXsaUJmiSd13cerYbuM3368cFgF1ybIbnTk=;
 b=oFNlnMReo4/eQWoLWRt/vyp2XeFdfzXSReTOZVJCQva6RVFOfhoIG9qieNF2QUHnIm
 wSnvRkTFeZp6iVSh45XHxxIMAqmSPu8gIUfB3WxhfylczD+AEAmevrdiLZtoJseAwi4Z
 CJ1Yio2gAxp7NrbCqQVDWB8U4F7O0hGJHHPSo7jDW3DvBfSWfGKdrjL07KwWL4prTa9E
 EMYUh/tOiBXrIsTxP8wxQsgGWsB+hMgH0rXzMc2T4JIvBsRx5S+gC9qSKTLxfP8ILKPX
 vfQI067hxj5CIwZGDPburwjnuTTDDF1+K0chWVsX34NaYB5cyneDZFwggxsPybSDSOBi
 0+RQ==
X-Gm-Message-State: AOAM5324egbqI8FjukVABN2WNgOVCscZIb3Y4NQhdu3ik5z+k52T5fMR
 GpZ4kCxChwEIKst6aoFAuHs=
X-Google-Smtp-Source: ABdhPJwoWtXQBa4bBhOrr/hAGclT7oR71ftv1fFkA/FD/hXBOdJCLFtbTmZPAJbL75q6V94kP3HcKg==
X-Received: by 2002:a63:5845:: with SMTP id i5mr7465833pgm.355.1608370074869; 
 Sat, 19 Dec 2020 01:27:54 -0800 (PST)
Received: from localhost (g39.222-224-245.ppp.wakwak.ne.jp. [222.224.245.39])
 by smtp.gmail.com with ESMTPSA id
 mz1sm9467603pjb.33.2020.12.19.01.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 01:27:54 -0800 (PST)
Date: Sat, 19 Dec 2020 18:27:51 +0900
From: Stafford Horne <shorne@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: soc: add the required property
 'additionalProperties'
Message-ID: <20201219092751.GI3168563@lianli.shorne-pla.net>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-4-thunder.leizhen@huawei.com>
 <20201218211706.GA2190351@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218211706.GA2190351@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_042759_154341_D1AED9F9 
X-CRM114-Status: GOOD (  14.61  )
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
 Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Karol Gugala <kgugala@antmicro.com>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 18, 2020 at 03:17:06PM -0600, Rob Herring wrote:
> On Fri, 04 Dec 2020 17:38:11 +0800, Zhen Lei wrote:
> > When I do dt_binding_check for any YAML file, below wanring is always
> > reported:
> > 
> > xxx/soc/litex/litex,soc-controller.yaml: 'additionalProperties' is a required property
> > xxx/soc/litex/litex,soc-controller.yaml: ignoring, error in schema:
> > warning: no schema found in file: xxx/soc/litex/litex,soc-controller.yaml
> > 
> > Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> > ---
> >  Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> 
> Applied, thanks!

Thank you!

-Stafford

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
