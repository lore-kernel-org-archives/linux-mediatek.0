Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A60C3F68F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 17:02:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9A12465E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 17:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NOAnLJo5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9A12465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CIFV6wznf43t07zTrnDkE6cDEQ7eD1qd+yotugIYNY=; b=NOAnLJo5q0eN2Z
	20Rpaiz8gDZunUq4pkByMlr2v7iA6/7ZDuN+ReqKAdzsLY8EPnWA/b6W0J0K9ekcxzzYp9131EjwW
	C/Khg85CYTfhQhyfLqaGjTfm4xRmBugkfTYqmt3HIJkKP7tfm2YbDfomRiNYtM5WD/bMuzzcaziQJ
	F7TghSQZy+jZYPrnMDKhTi6lgeW3O4x6w8XamcBb9Ie4pQovKp3ugVfK0xJvqOWBkVLFwFV8wRgMH
	OeZBfdgkUSAOrFGHi8RUD/XbXqfNc81rd5wBYGXXpsPsiBChzJZhKlcrps5FQmdevSHQNckwTR2Df
	OJeBXvppyj3RC1ZkW5rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihciV-0007Ck-QZ; Wed, 18 Dec 2019 17:02:32 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihciI-00071S-Mg; Wed, 18 Dec 2019 17:02:19 +0000
Received: by mail-ot1-f68.google.com with SMTP id 59so3262082otp.12;
 Wed, 18 Dec 2019 09:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JaI7AY/5dEsE+PzKKfws1NegVl++uA5oApSBgLNQCls=;
 b=N6jmJZ4GEqHNmTydBwy+jJG6rGPa+ZV4UY44ajoTzAa2Gq6I8kAqRNzp18MqG8G6xj
 Nm5qChA/hhKJTbfvhzBx1kvyAtW9HZRGsQF3WzZsYOL4mFz+tx+JoI2x2KL+h8Pzy7p3
 nIUwxq7eNNSOaJVDTmZ68iUc1xSPe4z2XYYlowR3zOA9O2zuNM6vsHsj1526QXRs9uRg
 xAovLevV19sNag9hLRZ0sV7Mt3XZ6fgku5Qjulf8DlnchCCvoGufrcFhrLGaSKe906oC
 nJRxx4fIILqnwTKAEtTzMYDJQZDpSfKj7YXOP0ktqq1L8vja+VAFPKs0w0+u0PmPJN8K
 ot2w==
X-Gm-Message-State: APjAAAVmTkMnMNYrDPgBaeRwGvNkKtrWhWUWA4chpWJbxj4Lg9GWVRW/
 K14k9Acea1NbT39KxWv7bA==
X-Google-Smtp-Source: APXvYqzOiFGi11lFLhBbyJQ2UV01N4xUjbtoI1m67WTwLSZq6goK5Ks+0SR2sX/w079C4Hu9mqDTmw==
X-Received: by 2002:a9d:7c8f:: with SMTP id q15mr3730626otn.341.1576688537723; 
 Wed, 18 Dec 2019 09:02:17 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r13sm963542oic.52.2019.12.18.09.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 09:02:17 -0800 (PST)
Date: Wed, 18 Dec 2019 11:02:16 -0600
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Subject: Re: [resend PATCH v6 02/12] dt-bindings: mediatek: Add compatible
 for mt7623
Message-ID: <20191218170216.GA18152@bogus>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-3-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191207224740.24536-3-matthias.bgg@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_090218_741110_E97C5383 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, rdunlap@infradead.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 ck.hu@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@kernel.org, enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat,  7 Dec 2019 23:47:30 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> MediaTek mt7623 uses the mt2701 binings as fallback.
> Document this in the binding description.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
