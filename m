Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF8CCD5BAC
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2026 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tfQt4HoUFqa18n+xYHwjwEUdYtlmVHufdWp4wUmY7fE=; b=1T+mN8hUTTM5X6t5NHXut0q2Yw
	4A0lJM6JABrToxgDHbXUnCaTPm2uPJk3LJ/Eu3lZch105O1rP4uCaf8k4roN/Jv8Z14dPVjOMXkUc
	Uk7JmVRDdr7fGNS1cCWVHwPQ8UuuMNev5jLkKKvSYlG4BxuGyOvPTrMMtm353j1j5EQw7QGbMQjkM
	qY8TviEu6L00oQT8CWhmYYMGcUgMtf7VewdKXuSliflANYstpLt1o/+Sfo+HJyyyhe2OWfbAA87fB
	QsjLIQbOo0oHCKgarkFvClzy0sFN9CL2y3gPWiyiGf1z7agBi6nHV9Ly8xJsa/kHymrKFjPP2LpJ0
	juufd8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2sg-00000007mOK-2CCN;
	Thu, 21 May 2026 12:52:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2sd-00000007mMu-2PsX
	for linux-mediatek@lists.infradead.org;
	Thu, 21 May 2026 12:52:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48fde648a71so43878325e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2026 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779367922; x=1779972722; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfQt4HoUFqa18n+xYHwjwEUdYtlmVHufdWp4wUmY7fE=;
        b=R8P7HLgZTSLFhq7Bc6AooF6XMVSgofcOgCkaHhEbXwcQKckdJV36Ty1cGKlXBfw/bx
         XM+E6O02O+0rm65zfwHKP31SfEq0WIwy1MeaUXZrTzH2VEO8LlWlPlg0797oUYUrDkeH
         /vKYyCGkgZySSEnpIAIDt2SDtGR7Rg7o2LYP6uPf4NS9YMrxhnRwbV3KngVc4NbMBy+/
         1zCj7e+Rm/Q+UGYg7W3vSGxjEYZ2IQeVyoqHASGTzG/oYB7j0oQIrbiFV2Ugh7hNAOxm
         m3peCi2XpJQN+Bc2cmiU1CUjzygZ9pptERmEnDt3/GASFHMDSKAJIdHgZmK23WQPb+LQ
         vsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367922; x=1779972722;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfQt4HoUFqa18n+xYHwjwEUdYtlmVHufdWp4wUmY7fE=;
        b=DejKrAGmYNjOMWq+eZ1N+UPuh/YmjefwvgvegfgUfatnY+YYSEqhW759f5fZ0gHn6k
         cdjZpKOGx+zHGk7G+k+5VpT/DfCpGxh20ZIwR8UZ7ro+xmOTF41jgD4HlRZrrTV3GJ+1
         1JjE92eyi4hcy/rgBdRgVZYenx8DBB3xKY2L0nhOFjS8VB9yLR4qftqNSYbSbqWuf9lV
         IpdEOVriYucFsdSbinzBoFXYuxt1PflNED1azxSzPFl+R1sRdNiYR+p3vLjxfrNfOp62
         3rJ8G1Spwyo+IYbIK4JaWG9KGXMDtYS1d9NYeyDrUjerWtNubUkYzFaO2MvUzuSqmTAM
         EXBw==
X-Gm-Message-State: AOJu0YxCqQRdhtX6jhxlwhgHcTGxC2ol/+Qe/Ed+Zdtu+bH2CfHZK+Fw
	1wPjBEt+2mHZc1p0a3SL538yMTmFjxB8BOeQqGuq0Z4KwK4ZTcArsyh96yTaBw==
X-Gm-Gg: Acq92OEpgEhjseOJZM7F6uUxYR92jGJKxKKwJHCcwwRIUiQuQGliuGRULseh7B2tLrw
	EDQ0eywDKnx1VhVqwyEY7hiuIAxZxjaOuZxgjUiuXzVEGfdgtXBnR675gvloFAVDxAfLQd6iXJ3
	zJo+vaGcS00L8DdXYmABfnAPkr0jlBH35jE0AO4hk1ymDR5709G/zlvcOhY0cESws/09hs28zuZ
	atwAOfE5rbuWGNSA9xbGQliAH9et9192LycI3wNDei1lmBH/5lNyHIVCGYx4H5ORYp3nziO74JK
	Mrm/G60Nf5ClRpOaPCfGspa045n0i3uO3iGIx6+AxRkvndS2CQesu7xtIibOyW37lUbdZta+sT+
	u+/V1fREfAP8rNwr3rkQto7NpTbQbyXnbYjhlbPSVQ+AomKUikqzZGJMYlhn9Z8f5Ea/1RdLqVM
	p+HFQeAMW+JSYHaTFkMq7ipOA=
X-Received: by 2002:a05:600c:3223:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-490360c125bmr16748965e9.12.1779367921596;
        Thu, 21 May 2026 05:52:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035eec6casm15414025e9.33.2026.05.21.05.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:52:01 -0700 (PDT)
Date: Thu, 21 May 2026 15:51:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7996: Add NPU offload support to MT7996
 driver
Message-ID: <ag7_7qsgKZdAfFjA@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_055203_621719_32C83956 
X-CRM114-Status: UNSURE (   5.79  )
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

Hello Lorenzo Bianconi,

Commit 377aa17d2aed ("wifi: mt76: mt7996: Add NPU offload support to
MT7996 driver") from Oct 17, 2025, leads to the following Smatch
complaint:

    drivers/net/wireless/mediatek/mt76/mt7996/pci.c:144 mt7996_pci_probe()
    warn: variable dereferenced before check 'pdev->bus' (see line 126)

drivers/net/wireless/mediatek/mt76/mt7996/pci.c
   125	
   126		mt76_pci_disable_aspm(pdev);
                                      ^^^^
This dereferences pdev->bus so...

   127	
   128		if (id->device == MT7996_DEVICE_ID_2 ||
   129		    id->device == MT7992_DEVICE_ID_2 ||
   130		    id->device == MT7990_DEVICE_ID_2)
   131			return mt7996_pci_hif2_probe(pdev);
   132	
   133		dev = mt7996_mmio_probe(&pdev->dev, pcim_iomap_table(pdev)[0],
   134					id->device);
   135		if (IS_ERR(dev))
   136			return PTR_ERR(dev);
   137	
   138		mdev = &dev->mt76;
   139		mt7996_wfsys_reset(dev);
   140		hif2 = mt7996_pci_init_hif2(pdev);
   141		dev->hif2 = hif2;
   142	
   143		mt76_npu_init(mdev, pci_resource_start(pdev, 0),
   144			      pdev->bus && pci_domain_nr(pdev->bus) ? 3 : 2);
                              ^^^^^^^^^
so hopefully this check can be removed?

(Proably this warning is showing up seven months later because I
deleted my cross function database.  Probably Smatch wasn't
complaining before because it knew that ->bus couldn't actually be
NULL?)

   145	
   146		ret = mt7996_mmio_wed_init(dev, pdev, false, &irq);

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

