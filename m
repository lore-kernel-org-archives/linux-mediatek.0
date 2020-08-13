Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617E7C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 13:55:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E53A20774
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 13:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y81W7RKI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agccP1KP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E53A20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=peTE+oyX/8RTfSJw/bjyRj2eYrxhnnrVgVLTdaHs1XU=; b=y81W7RKImdOqQx20uUrLyQUiQ
	QOTp2XsWz31MNGKU7LMI7bCI4VgiM44lNgUOdvhOjOk0+I+HWH+lCTS/mvThrqAPxCAcuKf+UH69b
	hR8lmBnTL2gZu+x1/l8YR+pr7PJ9BAy4UFxdHM6I2m/znCbLQxbn/Osqk4xIA2f/BVM3zpwMFTI8S
	jBAZ06BonUq0OxBexCl9CyXsQF88qMYOh9E4qHURVG2nkzaOZ8hi/F8ieraHpVuEXJa7vcysJ+Ldy
	6GyBcHpVWYtWncVQ8v77odLiir/9TiRfNyexGZoGAb1CgioGR8zDKDksFkXmYTFXL3FKV+P8Ft5D0
	xJLAi17Cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6Dh5-0006Nq-2B; Thu, 13 Aug 2020 13:54:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Dh2-0006NR-Bz; Thu, 13 Aug 2020 13:54:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id r2so5370472wrs.8;
 Thu, 13 Aug 2020 06:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sf/SftiD46KRmjklcq1t9/LS42BB5ZSQCo3saQVqHK4=;
 b=agccP1KPb72z/gkb04zLo4qeG+xd1UJrYMzK6+6w2B5gLm7docgWCP89TW72fBpoDC
 gK3gYReadqOvxeO3T3OBj/myfHOMgMIXdtASuHjb+Mo8O81lOlagy1/PmU1qOF52zfjk
 zQgRoDH8U9pV24TmfiDp1egqvLvJRcU9M1NOM0MBFNh+uuh75gvtvbV4X9DCFQCPc8hI
 6rupc6mD5ELdrBa9CKbNWdrjC5wMPQXnLkH4lUH6vw3WoITYNcI+/7JvJYML5FXe5U4b
 ak5dCSGmE3XPBAyu25fDau+VFmXGAXBLylk/PE17rShq8CfrErx4lRoDYwVDOweHf7kd
 lHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sf/SftiD46KRmjklcq1t9/LS42BB5ZSQCo3saQVqHK4=;
 b=f0GA7ix1VSow8OT+DJ1+xmofdiWzE/dpzXePhCj5dv7FWEpnDDAU5kBRnoFK2I9pFl
 1srMdhIfEzwjSUwhl8fiGtWoJbemUNpXOLFS5/333ggvPu5kggns77fX1C2OS+//N4FM
 NE7s4LN8nAChWlcu3zh/eDliZelD/roqazRi+RK9UIgwxpvCeezvEhxZ/odojWUvODJq
 51rS6RJw1JZrDp03cFLBf+wng/dUBYZgNjV0ViwDu1y9Q5SXooxccilk4kVtwqmgU91X
 W+0fJTNV3s6SfdMPrjmaENyOI9sT7nc3sQGFLmS4VjtIqjoBZull4K2XwDrHAuZcMrTJ
 /wFA==
X-Gm-Message-State: AOAM533aYybMzcUdji29PuYvuL7KdQl+E2HhZ8vf51W5Mkz/shM4bsxZ
 SmB2C+IUSjc0KAQjXDkcYVc=
X-Google-Smtp-Source: ABdhPJyMDNz+ijdz996HXAu4epKQmW0kjeI+dQKGPU5iYnfmtaSci40eu1LwseA1AoxXvZNnOWVDuA==
X-Received: by 2002:adf:e504:: with SMTP id j4mr4292799wrm.205.1597326893217; 
 Thu, 13 Aug 2020 06:54:53 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.232])
 by smtp.gmail.com with ESMTPSA id z8sm9339432wmf.42.2020.08.13.06.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 06:54:52 -0700 (PDT)
Subject: Re: [v4,0/3] mmc: mediatek: add optional reset property mmc:
 mediatek: add optional module reset property arm64: dts: mt7622: add reset
 node for mmc device Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++ drivers/mmc/host/mtk-sd.c |
 13 +++++++++++++ 3 files changed, 17 insertions(+)
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
References: <20200813090618.28009-1-wenbin.mei@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <195c7bfc-38e4-8d5e-af79-cc3f00b552a4@gmail.com>
Date: Thu, 13 Aug 2020 15:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813090618.28009-1-wenbin.mei@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_095456_510288_F32B7DF8 
X-CRM114-Status: GOOD (  15.58  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It would be good to provide a list of the changes, so that one can easily 
understand what's the difference between v3 and v4. On a quick glimpse I didn't 
see any changes.

Regards,
Matthias

On 13/08/2020 11:06, Wenbin Mei wrote:
> --
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
