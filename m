Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3337E99076
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2026 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wet2DYKEwk3JQ9CbL3lHmxBHJf7aDapnyclx38VwBQc=; b=xBFebGmdd7p4k35xZQmS5cglr5
	UnF5evRk+mkObTm512dVSSDm19nQYfWyquo0Ib6cnVdVYKINg5otwBjXRZmAw3AGMD6kMVLp/X7pp
	A9AqvwYXZOlUo9hLRhzfcIdVpWV+UfSLmGbpb26U/wNJofjWRr3Cm281ryZopDfmS54jHwN3g3Esi
	yilDcTnT6XtktgDOMOs/hGT62wTdnY4X/it8wak3Z0a+0A90wnUzIGzrgpoDSu4D2neRofUsdpubb
	zPl2QD20zuRyl6xOB173+vG+wZZaIrEQq2q/AL3sj2e0j1yANq+USKagFShwGirptN0sXuurYZuxC
	5h9dN6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8s4-0000000Bz8d-3VCz;
	Fri, 10 Apr 2026 10:13:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8s3-0000000Bz8S-3ReF
	for linux-mediatek@bombadil.infradead.org;
	Fri, 10 Apr 2026 10:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Wet2DYKEwk3JQ9CbL3lHmxBHJf7aDapnyclx38VwBQc=; b=WUFpLWtpJkQ9IwjLJKTlgOTDuB
	NeBANAzLWswIz3jRNwasby53Kf1CqAY9NWHhEQhw4sr6ZCC+9yt+zjbORRnJ4PLaxMB0i9d/OfByF
	T43twoGrIkz//t07CLFbv9QEu9Ad1qh/bCa1gStZywznNWvCOP69ofsn/HGq5Z9wqgsAa6qWx3BHc
	sJbL1HHYSnV6/NdnXK/SnuOZNQIWsK9E/kucsj+G8yca0EMkgraTDvNN3qpoZ7abLDVE3MFEFhEij
	3kjlZTshw9gOEnIpBNY2JZp3xPyT7T4h2eEQxso3snjxVqkO2LqxqCYmFJjTpxDgb4O/rtEKOnBDp
	/FvhNFsQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8s1-0000000DGmV-0NuE
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Apr 2026 10:13:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488c2690057so18145905e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2026 03:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775816027; x=1776420827; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wet2DYKEwk3JQ9CbL3lHmxBHJf7aDapnyclx38VwBQc=;
        b=NpJ+QgcHDJCQOKqgFYCm+neA4WVxvy27gz5Ca9PVSiQV0SlCeY8di1iyCf8XG+ePQC
         vsh57h0LqwPLg204dGNouYspuox4TFh6e2AKDVjhTwRheUwYH71pEfiMAlJt7AVuNXdI
         ey1CmC1iuDFtO3LyWWKeafSMWzsdqZSQBgnyhs2YzO1nTBQGpKMp6phnjhHaU8tgvIM4
         CRAT1STWZFUS2cdixtZsItHWE1lPdDW04IxmQ8suFqRIpAeXmktP6ydgKQa+E5QLCocU
         X2LUK9pb8mHvZ2YyCU6aaVlt8iWPOUwBV9e0ih9twSYZxfX4OpVgCbhUEzNDm3UzxCsV
         l25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816027; x=1776420827;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wet2DYKEwk3JQ9CbL3lHmxBHJf7aDapnyclx38VwBQc=;
        b=BcFqPd0bU0zF7Y0ve/JWKtW9mk8vSECGKZbY6G8ec2TLV1pCDOo9mAGzCnPzaSHvr9
         YNjSIE6B6KFY751612j9IfCIBu29jsVuDMZl6j+PiwOnt7WH19yKFB3qF+z1lFPfvemi
         tUrwugQiO+9OrvWb1HBzVJM8SCEwxMvDeWFFmH+25ZAXEk5UNQfjZTs4+1MooQFpZsZf
         y8CIBjABNUeacWdONy2rdJYUQB1E/jkzuJrx4h5hgk2Bnj3icOdcwMCMrAnsfZOvjHtu
         KVTSr0xQOSAm8ZOPpeK0/H7LMkadbcJCVchwqI1PYGO//wCvBjboJGjnegFOEBhjVvH6
         eHmA==
X-Forwarded-Encrypted: i=1; AJvYcCWENzItNAzxjZfDHEsH28IrVqrs0b+RU1XvWkZTVSgytmC2UHSWs7Xh+AL9lmwpUB+kI1yJFMO7pcDWbU8hjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOXBHQ5GnvxSS7pnHdF0o4BqWqPkmEgKnWCPC+OQpy+TGTXW94
	mtroFSULOJEw2/IVzBTpt9BFiG3UA1r/81A60cxMikZwQsCOpjP0FBebhEatxDyX
X-Gm-Gg: AeBDievhIfhoQ8e2WKZG7ufWyYsfY+s6XZjKTbpJVokq6THU/Q8CbMtierNMxAKECG7
	Sv3YYPnAqkRkSZb2iZkETIUgGsu5d0+bJWXvobbLJW02DLOVIK3DRF63J8RT3E5SmUICYdi9umn
	OGhooSrjVq//srQ3zpZv80wE+1wyMHUwYy1B5A1chTMciGtO7daBDRwd/3a3XnA+gg4+5aFxrpB
	dsx0NhXfKKXnfLN6dDzIC7WRqwjwTSESIPQmx8DiiJYBMZ1QgN2X5DsQYeJwI7lSPFSCKrSdU2G
	czjxsmXD7LEQiBvezXBWvgGXXTIOq756mtrKBDGO71XjnRea0YgPnAmrgttpk5Ah1zbQbwA5i2t
	jJh3NXhNDKLjC/rY01sFyOjt7Hs/oZ1NTZnmLQCsIg6lsqtumYAnOAtSc9BUgxzDl3PTzLR2aUr
	weJHey8ze04x1YLNNGZiZAN7mMU9Xk2w==
X-Received: by 2002:a05:600c:c117:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-488d68af0e7mr21886205e9.19.1775816026971;
        Fri, 10 Apr 2026 03:13:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67ce3e4sm36755705e9.5.2026.04.10.03.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:13:46 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:13:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7996: Integrate MT7990 dma configuration
 for NPU
Message-ID: <adjNVyjGFNxvJIW8@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_111349_204086_CB2167BD 
X-CRM114-Status: UNSURE (   5.46  )
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

Commit cd7951f242a7 ("wifi: mt76: mt7996: Integrate MT7990 dma
configuration for NPU") from Jan 22, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7996/dma.c:683 mt7996_dma_init()
	error: NULL dereference inside function mt7996_init_tx_queues()

drivers/net/wireless/mediatek/mt76/mt7996/dma.c
    664 int mt7996_dma_init(struct mt7996_dev *dev)
    665 {
    666         struct mtk_wed_device *wed = &dev->mt76.mmio.wed;
    667         struct mtk_wed_device *wed_hif2 = &dev->mt76.mmio.wed_hif2;
    668         u32 rx_base;
    669         u32 hif1_ofs = 0;
    670         int ret;
    671 
    672         mt7996_dma_config(dev);
    673 
    674         mt76_dma_attach(&dev->mt76);
    675 
    676         if (dev->hif2)
    677                 hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
    678 
    679         mt7996_dma_disable(dev, true);
    680 
    681         /* init tx queue */
    682         if (is_mt7996(&dev->mt76) && mt76_npu_device_active(&dev->mt76))
--> 683                 ret = mt7996_init_tx_queues(&dev->phy, MT_TXQ_ID(0),
    684                                             MT7996_NPU_TX_RING_SIZE,
    685                                             MT_TXQ_RING_BASE(0) + hif1_ofs,
    686                                             NULL);
                                                    ^^^^
Can't pass NULL here.  It leads to a crash.  Use wed?

    687         else
    688                 ret = mt7996_init_tx_queues(&dev->phy,
    689                                             MT_TXQ_ID(dev->mphy.band_idx),
    690                                             MT7996_TX_RING_SIZE,
    691                                             MT_TXQ_RING_BASE(0), wed);
    692         if (ret)
    693                 return ret;
    694 

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

