Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17464EDE9A0
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLtfco7CYTSkruhDHn9AtchkZ7x9E9bb03vUF9ZRl8c=; b=uQemVNjYLGIqtERzd+rcvzAKK2
	kRWoTT1+b59UeVEt1medVWUzj11VLtX+bw/SbmNRW10kfWLWWhKcqqCw+Oc3ApBXOrpgrfDXVQnuk
	rvQGwLA4wgjBgvHMJUfP/KR0SottPHtht40MAKZ1g6ooDvWKK5MnyyJHsCHXT6oXaVfxuP08dddiB
	BCxTQ2aAijRCZb+aJ5d2k2I7GjcTQ2cxArw+gWlZVxG1F0sbQuUn2QM7N+LuTfBrawxqms237t8NB
	ZJ0an42Dvvpjlqg4SonoP/8+xPNiKJEcnpiieoubURkSKE1xRO9jo/nhlpoRLQsTe2e1Y9IFWNZgj
	GLDBWSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3Mo-00000006HBG-1kYr;
	Tue, 10 Sep 2024 16:05:22 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3Mk-00000006H9E-41eW
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 16:05:20 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-45693d58a19so41968821cf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725984317; x=1726589117; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oLtfco7CYTSkruhDHn9AtchkZ7x9E9bb03vUF9ZRl8c=;
        b=AxiPkXeYaFqpTbKiIsJcbQfHJ9g1PpIBrC8BA79M0pDAdk4BGI3oeod6NXmZbUO+XV
         kQOBL3eR3HDNIUTdJqnzJC5GWxOBn/Cal8JO/rkP8TO2gURqTP2VZPFXp4IdD7bmPnSx
         JCL9SsdA9rOI5bctrJcXt50B9LPcBMs4WUutE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725984317; x=1726589117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLtfco7CYTSkruhDHn9AtchkZ7x9E9bb03vUF9ZRl8c=;
        b=N6Hli1p3zVlVkxMp09BIcmaqE0LW/sfyRP7P5ZAaXM37p15z5L1nVwBO77dCc0U+PY
         E5SgxKefdRy3GBLnGJmpPBqMVDN26ItTIJHzs0XyYfGQ+LCQq+9h937IO4z4jTHwDblL
         rK7L2/XhkBKetrJS6mUK2drRQ6UX9pGQIBNEm/d5jafi0hm1HwoK6qERT14XKxj54f4B
         nvraSqwKErHD/BHtS5kQx6iB8xyML6vezJMXWp3rIOaJm+QwicSLHK0yPIUgI8QUwgjp
         XggSM2WexnZVPmoS/l8eUWuK1kSXqtGdnXhoXLbm1nNAOt8LUSPVnXB5/AvFGM0c5/uC
         uA1w==
X-Forwarded-Encrypted: i=1; AJvYcCVhD/9IktLwFQFYuQRzAOotk2IglNqICRtCRVU4FEM9hSWVSiEDxLlyT6vU6t/pJhyNy/G7XuJrtfJHkUl29Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpNrgZYu71mqyECojqXlozDqlBH4DrsTgiLXxFB+f056qb85AW
	HIfxqhhKJ8iPZQccEkGai3v6p1qplu64gmTKv1nbKpLURzuhWKKsD597uKPjMQ7HYpRlD/Vzofp
	ThxTa
X-Google-Smtp-Source: AGHT+IH2Niro5y/18Vi/Ard77mWLaT6S4Gpgkya1X/COeSQICffI9c5Z3tI/wb42SeUeh44mMA4X+g==
X-Received: by 2002:a05:6214:3d0f:b0:6c5:50bb:4376 with SMTP id 6a1803df08f44-6c550bb4391mr71444336d6.2.1725984316612;
        Tue, 10 Sep 2024 09:05:16 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53477baa9sm31939276d6.128.2024.09.10.09.05.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 09:05:16 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7a9ab8e5f96so268773385a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 09:05:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrItNFk0X3iTCIVA4gHLoeuWUYt1Im4Qdnuq5wlARvs3WVUXxOa5hO+mpwUpbrxV07uJ7f38h2cASlOmt6ew==@lists.infradead.org
X-Received: by 2002:a05:6214:2e4a:b0:6c3:5e2f:b43b with SMTP id
 6a1803df08f44-6c532aeab88mr169354396d6.25.1725983889900; Tue, 10 Sep 2024
 08:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <1ac1ae779db86d4012199a24ea2ca74050ed4af6.1721300411.git.quan.zhou@mediatek.com>
In-Reply-To: <1ac1ae779db86d4012199a24ea2ca74050ed4af6.1721300411.git.quan.zhou@mediatek.com>
From: David Ruth <druth@chromium.org>
Date: Tue, 10 Sep 2024 11:57:32 -0400
X-Gmail-Original-Message-ID: <CAKHmtrQFv5S0Z+mEy01haFLu=pi8XuAUDs-UZxR9CjNtBYOzTg@mail.gmail.com>
Message-ID: <CAKHmtrQFv5S0Z+mEy01haFLu=pi8XuAUDs-UZxR9CjNtBYOzTg@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: fix a potential scan no APs
To: Quan Zhou <quan.zhou@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Deren Wu <Deren.Wu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, KM Lin <km.lin@mediatek.com>, 
	Posh Sun <posh.sun@mediatek.com>, Shengxi Xu <shengxi.xu@mediatek.com>, 
	Eric-SY Chang <Eric-SY.Chang@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, 
	Robin Chiu <robin.chiu@mediatek.com>, linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_090519_020110_0ED6B43C 
X-CRM114-Status: UNSURE (   5.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested-by: David Ruth <druth@chromium.org>
Reviewed-by: David Ruth <druth@chromium.org>

