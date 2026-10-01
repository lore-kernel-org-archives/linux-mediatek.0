Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86990CA5FA5
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2026 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIEy5cT5mmkkVcGKdpbeH8K331ZFV/0IWVEdNWVBdcc=; b=wn+QQuGtbP0IzMXXj1yY2JPL3M
	xjAchPylP9k7eXbhkOfMfy/iIDr+K1mgrN6DIfjA2KRj3ZU3K/Ajx6nSN5aJ+as2pqj9ojwZDidbM
	67RfOTU1E8opj/KF4YOaMoXBnvVmmRSHokJoUgbV4dUWbVW7qd/F8WyY4fB6XedQw5s9KybQ+ymkj
	5Szv7H3PStel/VHN888gt342VtqIEM/OqIq62B+d8bwS0kAnt4aUJgrZiCIktrul879mqGwxQwBgQ
	Rm0DRnrBAYHRb8HlO2nNR21jToT4nF81VJlP8cqpHswVpnvFpMkccfiiwzrwsjoRndMNVA/bE2pM6
	hZTZ1lmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCMB-00000008Cih-20U3;
	Thu, 01 Oct 2026 08:41:35 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCM9-00000008Chw-0rYa
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Oct 2026 08:41:34 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so3832689a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Oct 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790844091; x=1791448891; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIEy5cT5mmkkVcGKdpbeH8K331ZFV/0IWVEdNWVBdcc=;
        b=Gv3lM8NGKghl+hQdkgk+SVdnmt7gATlxZE5n57PmqYQmgRm8Ylcm80njsW5ZgwPk0I
         aVHKEqYd5asImpdwan3gqw5ejUBxtBE0OwKzeQhgRv2EKrruMqmWeCXbWj+gL5jA+IuX
         9JCMm8Vf00uEV5ntDb40Kl09Z6/z7oHLacnWgkY/tev68C2hmE6z2pCLZddJUAhBiWHl
         JmD5z8OTpZNmDftuIxHEZ+/S2vYdDxqBXJhyJH+GSuzF1fcw6JnkHhQeFHjzXjYkVdPV
         h5wpQKq+PnOHBuE24vFD9gVOrRTmMOr+A1Jl+4Ge/BfiTwToa5XD6pPvVZ/EzDn52Rub
         p+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844091; x=1791448891;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIEy5cT5mmkkVcGKdpbeH8K331ZFV/0IWVEdNWVBdcc=;
        b=Bk/zMXdt4PoNOw+TX696CnOJY9IcW7jDFCw5tvFrTj8zpUt2NgZHObHdc9yhgxoK5Q
         gqSEnDrfgAc1sAMBDSSClEHokocVrsNfUOYCkUlPJWyc31moV/h3e7fIFOv3D5i06ADR
         tX9PsPsdPnwsJjk36/QsFRb33+pDA47S9nCNydO027EiFMEnTVdGYa39jFRb39xfSyM/
         YmMtPaC8YCCNYgPXSRgm6T3yZdD6mRmqwvf9bwi8qev+b9rksw3bAC7Y/IyCqH0XYf3K
         BGN9xYOwIA/Qmvu3Cl8Mi+OZ/XWc5wYiqKh+LFN/kHC6So7RYnJwzBxAMMh2cki0fofI
         Pa4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwTL6nmoZI0TF1fMwM0sI4GR7LK/gWc9LfF7vf+u8xKQFXcJKvJObcY+G28WDHvIo48yCAtTfWbPZxlAEyOw==@lists.infradead.org
X-Gm-Message-State: AFuF++mn1wciOUiCtIgqGURSeBe2HrPEXhUL4yGzGsmtV8h8EigVtY15
	xMqeKJAJANPfCQ2NcKqq5upg+3qprKCAjlgBo2SYYAEKOk/+CDcaMnBSxetilHGGsM30A+Yd1hG
	5Qk3DyHpxs+gjp5MWG9h4hA==
X-Received: from pfnn21.prod.google.com ([2002:a05:6a00:2b95:b0:886:fe91:dd9e])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7d8b:b0:3de:55ce:75d1 with SMTP id adf61e73a8af0-3de9e86af8dmr4024094637.92.1790844091336;
 Thu, 01 Oct 2026 01:41:31 -0700 (PDT)
Date: Thu,  1 Oct 2026 16:41:29 +0800
In-Reply-To: <20260909091045.1134956-1-naomi.chu@mediatek.com>
Mime-Version: 1.0
References: <20260909091045.1134956-1-naomi.chu@mediatek.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001084129.499805-1-stanleyjhu@google.com>
Subject: Re: [PATCH v1] scsi: ufs: core: Hold a clock reference across the probe
From: Stanley Jhu <stanleyjhu@google.com>
To: Naomi Chu <naomi.chu@mediatek.com>
Cc: linux-scsi@vger.kernel.org, mkp@kernel.org, avri.altman@sandisk.com, 
	alim.akhtar@samsung.com, James.Bottomley@HansenPartnership.com, 
	bvanassche@acm.org, wsd_upstream@mediatek.com, peter.wang@mediatek.com, 
	alice.chao@mediatek.com, chun-hung.wu@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ed.tsai@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_014133_272534_1EBB3187 
X-CRM114-Status: UNSURE (   3.70  )
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

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>

