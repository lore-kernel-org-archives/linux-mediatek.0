Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C589FCDB483
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 06:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R86kxfqrPEtr495qKYbi8YP7lktM7XvKgX2nq4nlfuU=; b=fNAxyFsNv+yyfaGqstZY1KMWHf
	0kB8gjynumcwwU3m+LnaJMd6aowZ5IsaQs19WQnyqMTLN0tDMA+MdsSYiSZkgjaKs6cuPn5ykpp8J
	QJmqcrPyz0gItz3rtWGiaBIjh6A+Vj53ckSrtRuTZpB3DQyDlCb4wym9HcfL8FKpbD3WtoMglqgSx
	VCgc1TtlkzNkaqsyoVxoCZK+Vt1UmiFCYQercJb8foU+fa5qHP4swyDSgO7h+T3SLRwn8R153folB
	wPNihQVqIYdi6UGa0knkpX7izg7iMyshr9fxZSKWzXRGqrAVW4tX7PFSSou5CC5oqu7527nuoUVlM
	fZ0wHYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsziO-00DsGT-1n;
	Wed, 18 Oct 2023 06:07:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsziL-00DsFe-0m;
	Wed, 18 Oct 2023 06:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7332A61683;
	Wed, 18 Oct 2023 06:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DEBC433C8;
	Wed, 18 Oct 2023 06:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697609248;
	bh=h/auq6HpOSLO/N4BVvzPRBs8wFljerSgSeyenywRUl4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=k14kdHnxqZ97agAIFMyDjHuczUDMuqPTAoLnzIWFM/jPbjraO7DPPFJFC4bivqoYY
	 JUrGrG3gf2H1E5+HjEQyhA/kUpvKYZDW1vX1/mfoLEz36vdzWRBb9cuzmjwm7HDdBz
	 ErG81JZoUVatTvvMWFjw4PVEXH9ux8VZ9/FVi7xx1VWYv3lEdqFRqjEQqyPMyqiymI
	 zotak707hUoVBhZoqA7uDfLuGoarDlAd/657b3Fggk8958IssNB6Al2XRFLWx+XKIt
	 Vr4VJCltmeYRZv6QYuHCPYLPLqVISx0UJRvMfqNhO8Lg81W4CHb6YqQeASv5wmx6EO
	 ihCvlCrWBobyQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Ryder Lee <ryder.lee@mediatek.com>,  Shayne Chen
 <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,  Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Simon Horman
 <horms@kernel.org>,  Alexander Couzens <lynxis@fe80.eu>,  Nicolas
 Cavallari <nicolas.cavallari@green-communications.fr>,  Daniel Golle
 <daniel@makrotopia.org>,  linux-wireless@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  stable@vger.kernel.org
Subject: Re: [net-next RFC PATCH 1/6] wifi: mt76: fix broken precal loading
 from MTD for mt7915
References: <20231017190510.27163-1-ansuelsmth@gmail.com>
Date: Wed, 18 Oct 2023 09:10:07 +0300
In-Reply-To: <20231017190510.27163-1-ansuelsmth@gmail.com> (Christian
	Marangi's message of "Tue, 17 Oct 2023 21:05:05 +0200")
Message-ID: <87a5sgea0w.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_230729_326797_D33D9A7F 
X-CRM114-Status: GOOD (  15.11  )
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

Christian Marangi <ansuelsmth@gmail.com> writes:

> Commit 495184ac91bb ("mt76: mt7915: add support for applying
> pre-calibration data") was fundamentally broken and never worked.
>
> The idea (before NVMEM support) was to expand the MTD function and pass
> an additional offset. For normal EEPROM load the offset would always be
> 0. For the purpose of precal loading, an offset was passed that was
> internally the size of EEPROM, since precal data is right after the
> EEPROM.
>
> Problem is that the offset value passed is never handled and is actually
> overwrite by
>
> 	offset = be32_to_cpup(list);
> 	ret = mtd_read(mtd, offset, len, &retlen, eep);
>
> resulting in the passed offset value always ingnored. (and even passing
> garbage data as precal as the start of the EEPROM is getting read)
>
> Fix this by adding to the current offset value, the offset from DT to
> correctly read the piece of data at the requested location.
>
> Cc: stable@vger.kernel.org
> Fixes: 495184ac91bb ("mt76: mt7915: add support for applying pre-calibration data")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

mt76 patches go to Felix's tree, not net-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

