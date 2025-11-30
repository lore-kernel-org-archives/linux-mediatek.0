Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C0D111A8
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Nov 2025 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMyv7xHpzBEGqAA6Ujonxbq3JvKho8WXoic6wC5QnCg=; b=Zbegl7yNCTyeauGADhD0Nurkmq
	rERCbO41zWqNA+RtY93v+vGWinT3e96Iyd8pnp23K42pFPE5XCt8gqblIltJe4f6P+DDlRtMVqet0
	tH37i1qihg9WVReDcGzM5z6pAsL1qQY3ugQiC4Lr15gqai2DbtqFm736LtX96+3NOarLySIfsYB9F
	oaw1qe6eMWBjYz48Qh546HVwGoqL9KOKFNeedalyNfg/wHYsHDkBzglxgE9VLzvhne0WA+Q+9530u
	qTK/y4Ci5Uv3MBbNKjDhKqQ9YDgufLva2Abmy7Rw+SIGmPaVIB1fCYAOMR/ryHUh5K54cAWiZbNgk
	HlYRewcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPchP-0000000299x-1vAY;
	Sun, 30 Nov 2025 08:22:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPchL-0000000298u-389Y
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Nov 2025 08:22:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477aa91e75dso3281265e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 00:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764490942; x=1765095742; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tMyv7xHpzBEGqAA6Ujonxbq3JvKho8WXoic6wC5QnCg=;
        b=bwc7tNazOPcIQAKji4HhK6NafwAyEnNAZp0AeB8/JH2S6VAn7Cd7gp+9rgbs92ejKX
         SkcVUkAP9iyBoB//ZKIG+fcTmPj8cPn4RDHJY+gx4vU+rVUHDOq+BitsDvZYi4Ytdkv/
         LrFBwbbDFx6c4gzzRhZDPkOE2HhsnPwXkELvTCVyHNT1Xy/5EnbtDgPS7erqyK1mKEKy
         SpTaJ+OnV4TAg6oIvoQaef5AJPYwisVmd3Yno8TUpDpvEenyvn9ygHqHKTouIKflKMN0
         DSlFkQSjPzyWaZPOX0bsfw98tARZkzXh6yYllURkFkNT9oBnLSLs/voFxixpBGqIaahV
         hLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764490942; x=1765095742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMyv7xHpzBEGqAA6Ujonxbq3JvKho8WXoic6wC5QnCg=;
        b=gd3Kfy8EautsX5Aw7hum7ea/aCytX3yMbHRNv2mQ6DlJ8zGLIrpoSI6Kp+Ty0mEdbj
         n+e2UKJohp7QAyQrTSAmM+EdmvgxktHQD3vcxe2/sI3lsyChp5KbzE2dFsYcNtO54Rwn
         79L8gi/+60/yjklAsvqGI1WRMetLMYu+TnaxkmAtLPLouGKRA9FhVjmsUjwJ+xpJSBdI
         IzL6ZTCxD5N3gV8tePDRhToYJ7Ndpm/KxHkV8xajyoM1e4PeaHf50zH4bpVHBKIEMeCN
         5mq9HBXS8TUV2CS+sck6x7u7tw4PnYKlOc6tuQACilVPMpl6phqysJFAcApZ5uLjNscX
         oKwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVS3YhOxWn0S/sd0lvXQfqG+GpS4S62qwy9OZQb6yfzh8VFTzd20xMN+r1Ry3mTLnjHL0j0pCXEMuE2fJeqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxDT/qd7RutxAr6dBGKkUkXz9KXLGZoaq4vqQRfF+CecFhBrVj
	9hzRPQt2Y1dLfoOFoKVowvOwaTcZwuqyQQLFLfjdfKyEfC92qhjixFHA
X-Gm-Gg: ASbGnctkuIxQ4E2XUqAl48HolHsmwmbdJo40gDLF32ikfl+k0rOD/FWuyhQ32+JQhXg
	dAEgoPTZZj3x+18K1oM0iYymqccBSK1ikXXB4Ttp3viWfC7PfLHGxP+5VJdBwU6AF4DTLbeXP+3
	Gu0rroDc9qTQLOcVJmQLQvpLSRrRTmZUo4OCQnaOfePFQsgioI1fTwhDc5xT/Fx8rMY/HrsmE96
	M+qx5cj/7QoeWXZugioysvDCWvjL0ezVPwzinwNjvQ+zMiSfu4GEG4p90ftQOme71tDExKocAsB
	yjOrKMXjoeTmdyb/ChzXDBP2El3iQtEapcwR44Fer7pg7/NuGptwVVb9qrEGTMCuCFZEqECGiZe
	RG+XMv1rKVYFGuCpn16zIAvv5HqCDeewAXFsfHqAqiftktmlqarGxwLvkqctV97YHZ0IqOLGi4W
	09aQ==
X-Google-Smtp-Source: AGHT+IFxf5DCmAQb4WegUpiiTFHp05rmbMw9OobLeUqiCuq6pkZ68STqGne2876uNBNRHt3VzIgFBA==
X-Received: by 2002:a05:600c:4443:b0:471:1387:377e with SMTP id 5b1f17b1804b1-477c01ddc08mr202058375e9.6.1764490941614;
        Sun, 30 Nov 2025 00:22:21 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:36d7:677f:b37:8ba9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791115caa7sm172799055e9.6.2025.11.30.00.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 00:22:20 -0800 (PST)
Date: Sun, 30 Nov 2025 10:22:18 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Chen Minqiang <ptpt52@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251130082218.mvxlk3p2pxdny2ij@skbuf>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129234603.2544-2-ptpt52@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_002223_841802_595252A8 
X-CRM114-Status: GOOD (  12.95  )
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

On Sun, Nov 30, 2025 at 07:46:03AM +0800, Chen Minqiang wrote:
> This change makes the driver fully backward-compatible with older,
> incorrect DTS files that marked the reset line as GPIO_ACTIVE_HIGH

The driver _is_ already backward-compatible with incorrect device trees.
This patch makes it compatible with "correct" device trees.

We need care taken in one more area: when you make updates to the device
tree, *old* versions of the kernel are not compatible with the latest
device tree, which is not OK.

So ideally:
- patch 2/2 should be considered a bug fix and backported to stable kernels
- you wait for some time to pass between when patch 2/2 is merged, and
  when patch 1/2 is merged, so that users who get an updated device tree
  have gotten the kernel compatibility patch through stable channels

Then you need to consider that you break "git bisect" if you keep the
device tree the same (i.e. the latest) and just change kernels. That is
a trade-off that needs to be well justified (cost/benefit).

