Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9114CCA5FC5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPgmINCV8SVNtxSwxWT/uE2/pfejEYPQvV6kz07ef0s=; b=qVlPnaryGXpMKPc55slxHUn/KN
	DMqV55qvuypz7dKhhxNY1uH3T83k/bGBzPZCUR3JXC4H5EKFkH1kDiquV3Ck3sawjwKrFhwR9uBvP
	ciecg24VF/KolhfW0VCu7seaAERiHbp04SNF7mR1VQTCjbmoHN3HLzvKA8JyI7qZFY1lttwRhIpcg
	AMFfD7n/OoCL0AqrWkcJNfAy0bqDfQvt4OfjYcyGAemYGsQXWTLzZM+OPC/JSfirs60ETsmf6YxfE
	orEbdXo2iXreA1UMuwmuyHp/P6VFymhAY2DAP5+epsSbXvT/9obIQG++T/FW043Rr+dhlv8TAu7VQ
	Cct+G2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvvX-00000006Qr9-1yMe;
	Wed, 30 Sep 2026 15:08:59 +0000
Received: from mail-oo2-x2a.google.com ([2607:f8b0:4864:31::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvvT-00000006QqK-2RIm
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 15:08:56 +0000
Received: by mail-oo2-x2a.google.com with SMTP id 46e09a7af769-80a71781323so3269026a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780934; x=1791385734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPgmINCV8SVNtxSwxWT/uE2/pfejEYPQvV6kz07ef0s=;
        b=hKaStjpaR26Ebg9wxaE6hKsAyChUgwNbrQph+eqqM94v8Z9OeveLWGOp6ay9VG2QxC
         yWEUl1nlzwslNDyJv3v8e1lDvyG2uYig0mbz6vHiQsp6hrDBTbepyZQoI+lL8xZF+hO6
         VocU+o0FOv5bZDORKJv2IaqsgV5W3EbobFzFW3S4wq74aXJahyNB8FmuFNMGqz5mia87
         LfT4f+L1U6mZ3GLkiOYT/pw6vdqs85Nw0JLXnpJk8uEZJTInYUb86sUGdzGxPpir6IMH
         UklunYHHKj+Jdclc5vF5eyjb9F+5vbWA1S78YR286U3fNuLhwgJk/kT8KxSVn+ZTLsd/
         KLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780934; x=1791385734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPgmINCV8SVNtxSwxWT/uE2/pfejEYPQvV6kz07ef0s=;
        b=Av+uTa1qhVvEoTr6YIhnD3QTNkbW2Q/br0wEsnTq2Isvq4fgFIcuzCZBzMYBhyWH7P
         75wcCFz5IE+zBSMy3EvKWmaTInmoqg3h/zhnKHIm0fU0DsvBiZxeoeDAZkKQnQtz9XFN
         A1GrITrkcVVqYvgQNgq5k7ai+kAp2Mg6yUeXBsbq1apRa2VddX0FEs8H5Os3E4ZFr3cb
         nB6j4SqgtQPiTVg9lBXg6o4rXKlfviHYsj6+ltwvyCHigPvL+/yjY1pDgK+/wKFSai/h
         lUDQmvOpogKVr6wqdg+JwASzxb5qh0X/WEb99eVnzAhfqlRz9NKxZbfF4x2dZJHJ93cn
         ovDw==
X-Forwarded-Encrypted: i=1; AKwUvBzWzo7Bbl/OVpTYIgAECyWwh//+gMeVvroVb3p74/+3gaBW1tYtHzZI5c/ggR8nU7wJiqkm1LY4GueZa1MS/Q==@lists.infradead.org
X-Gm-Message-State: AFuF++mUFZHcucWVwL9r3vQjmiV6kjfc+yuBEEepqkteN9Phhzr/R7Fi
	Iw2U7/IY+70WSNpAyx+pUPmTE4mxEFkva28dXCxeiXGBT81B6ogpi6aA
X-Gm-Gg: AYBFou2P21IXn3zoghm0ETR/nozlRVgFzliwvZhRvSL/j3hm+C8NOPBxlNWUX27euir
	woxxf34YGNBVf6wjGEHD95fhETYEtwpt0ttooph7fySzaKeVvmCPEi3iRLGhoKIeN+LHaHQ9Nyb
	HgcxHiVBkQ8MRFLUT7P/ndznfyATYWNNUOD/EITdn5wABNi5aXJ8CoOUpZ8r5fIHIojB6HG5emL
	Rc1jfqmJQ7MLHBQEtT6AXY/l8pCMP+dWUEqKtUwsabZtLb9lw/14YdJiq82jcbXL96bYLXpOGhd
	ocWZwfaccaoQ0Uqn68tB1Ddc2E3jyMMAPGy8d31kFVE8hzq5VgTPagwsn+hLTpAE3sYWrKHEJ32
	0jEhehHWf2tJCKDUO9A6gvFX/7cB9GQvv/XAGgtsB9BNC60yepBMS1L3cNC9feQ8yjCKpaPi2s6
	x+Lhi51lMI3BG1Ptp/IvleEY4RLU4YfczfpHcdcXwbRvI3tZiTi1SdkW9NN5smgChsjjtuqKMto
	GH7wVypZ4or8KyknXLn
X-Received: by 2002:a05:6830:3916:b0:7fa:5c68:d04c with SMTP id 46e09a7af769-8204b5c2093mr2071820a34.22.1790780934250;
        Wed, 30 Sep 2026 08:08:54 -0700 (PDT)
Received: from localhost.localdomain ([103.179.231.92])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82062ccb8c9sm1087165a34.6.2026.09.30.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:08:53 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: linux-pci@vger.kernel.org,
	ryder.lee@mediatek.com
Cc: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 30 Sep 2026 15:07:27 +0000
Message-ID: <20260930150727.2897-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930120539.4967-1-sreekuttan2156239@gmail.com>
References: <20260930120539.4967-1-sreekuttan2156239@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_080855_628755_4E918581 
X-CRM114-Status: UNSURE (   6.78  )
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

Hi PCI Maintainers,

Apologies for omitting the revision history in the main patch post.
Here is the complete changelog for v4:

Changelog:
 - v4: Fixed struct device pointer access (pcie->dev) for dev_err().
       Verified build and passed Sashiko review checks.
       [Subject: PCI: mediatek: Fix integer truncation and handle
       oversized resources]

 - v3: Replaced clamping logic with strict size validation
       (size_order > 31 returns -EINVAL), added !size check, and
       updated size calculation to fls64(size - 1) to handle
       power-of-two sizes correctly.
       [Subject: PCI: mediatek: Fix integer truncation and handle
       oversized resources]

 - v2: Added size clamping for size_order > 31 to prevent overflowing
       the 5-bit AHB2PCIE_SIZE() macro mask.
       [Subject: PCI: mediatek: Fix integer truncation in fls() and
       clamp size]

 - v1: Initial submission using fls64() to handle 64-bit resource
       sizes and prevent integer truncation.
       [Subject: PCI: mediatek: Fix integer truncation in fls() for
       resource size]

Best regards,
Sreeraj

