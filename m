Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BEDE77188
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuYcpwf/FK7fdMDWPBIHW4XC8csYRmvKIIRdooKf82c=; b=Yv5pJDjURFw3Oex1ENuItgpbgR
	Z2sFXjGGmf085m3zUzNAyTXY8lC2A3BEKgWvphvC/t5VamA20NqP2wXn/f/5+bU4CncnExnQgZGof
	zMOBLehvQ7zgrivKTaYPSD1492/yTOCOz1f8Br6wB+sLbUMKRdvPyrqzBkzpyIp0Zo5q2bRZMdPyM
	LkZ1C/VQgfdxaxd4PDjw4RSAqcKRuVeOvGrm0jyczWj6IQ01Gz/fiScfYKcyczmbjL99rrMCy+5wG
	+WIgIahBrDLMcpm/uLI4Msru+OaPG60hw9e0ZRevTcnnl/TSJuNY5xigWlKbOIS++kyDWOiyTq0i+
	cJFauoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXXf-00000008t7S-48ZD;
	Wed, 08 Jan 2025 15:00:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXXd-00000008t77-2hop
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 15:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AFA15C4D73;
	Wed,  8 Jan 2025 14:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430ACC4CEDD;
	Wed,  8 Jan 2025 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736348416;
	bh=vuYT0K69rEkRC3CxiBZ9EB/G1aA4QJsYU0rhO3H3f6g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=BjK8ubFsl2AIUIwnNps134FfLIpO8rjI81wVwCZWvq8BZ9oJ1n9ni6R9s7YHpGkZa
	 UzP0KbsHun1nr5dP7/KSTja22dGJhbC0X65FJ1aLgFFZ/sPJtjy6CMSXw62zZPwynK
	 oFiNES0SdW+BydaLZ9TxJ4xp166fH1w4HI0Yuz0MzIYeMmKp1+tg8lWVKjd5W/g9O5
	 blruWdfpNq5Oj/zlNZXt9fd8WfBJydzPmOWDN4RCreWfmczq2EDANzfadL9PMQezk+
	 sDQS6BF4nXca5fMgeL4PAedCxn+JTOGqv6eSdMk7QIq8wg1WztmMDZ34tIWVS4H7QB
	 Rvirhl5aRcpkw==
From: Kalle Valo <kvalo@kernel.org>
To: sean.wang@kernel.org
Cc: nbd@nbd.name,  lorenzo.bianconi@redhat.com,  sean.wang@mediatek.com,
  deren.wu@mediatek.com,  mingyen.hsieh@mediatek.com,
  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/6] Revert "wifi: mt76: mt7925: Update
 mt7925_mcu_uni_[tx,rx]_ba for MLO"
References: <20250108022509.217803-1-sean.wang@kernel.org>
Date: Wed, 08 Jan 2025 17:00:13 +0200
In-Reply-To: <20250108022509.217803-1-sean.wang@kernel.org> (sean wang's
	message of "Tue, 7 Jan 2025 18:25:04 -0800")
Message-ID: <87v7uppczm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_070017_728279_F94B13A8 
X-CRM114-Status: UNSURE (   5.29  )
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

sean.wang@kernel.org writes:

> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> This reverts commit 3cc610e9069db69e4a0f6304993f4c98db52c3c7.

Why? The commit message should always answer that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

