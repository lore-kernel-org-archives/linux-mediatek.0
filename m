Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABC2D767E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsWxAPwzhm+kE3jyBcpSUlB88WUSWYtu8shw9eN3f+I=; b=skvgx2VnP+NwY1kl5nyg8ZD0jM
	gVRDgXsJuN0zH899BdZANFQZL5m/0xJVY0XcEzaz7h+VZ4mD6m9koBKb7VwrBJjmBLkQV9oA2QbsB
	rby7LeRby/wsv4oLt0yifmn0HKYex7lmZ76eLGqqpvvoXlQWlPo5hJtkRXYFnIM1/bGu4DIf66BLd
	obLvgefQJCJhT9N4VylkjKYUR8C2tBdW8ELQZYDtLpq0K+03DRpRtno3OtTiSzk7paIanltTK0pNN
	zJvEl8A/RIoHUIlqsGvfzEdFuxN57P7NmJBoA8Jd2e5f5bNWds1wCFrlSFvSkXuAbMIdBHREAYwLR
	DPtqKKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YDl-00000004Dfj-1ypy;
	Thu, 31 Oct 2024 16:40:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Y68-00000004C8v-2i8B;
	Thu, 31 Oct 2024 16:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0789EA445D7;
	Thu, 31 Oct 2024 16:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1296CC4AF64;
	Thu, 31 Oct 2024 16:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730391916;
	bh=kOzU4sWaB8Z+MTN4eCgKLw2cHRT9ijWtixUXAnUmrkU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t32C6N4seQsMZw8/8OYb3lpIsZd1hFHGoeWntGbPiFss9dtTp1gVTsiP2D265EW4Y
	 pFUaQMb9ggqGzl/Hj+1bAwpkBO0TnOgmmaolQCghuoQCKUEbDTLHdj1CaXIIYgeE9T
	 QDN7L6PxJcU6+pYftOuAo6hyt/GPVMe8tquGeGMpEexn8WDeY9/+ciL3RK5gAJwNYw
	 gc7g+Y+RfM/ogalnMFkaLs4INKpK0ECG97OL0ATNRKacfbPor71kKWEu5FYgGd7sHM
	 y1td18RUcsJgC9kzu3t/lABQPwEuFGYMH6kVYMLITxCYJznPIrk8jhzGcQf8/gG1SJ
	 WIayZYm7etZJg==
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 jason-ch chen <Jason-ch.Chen@mediatek.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20241018081050.23592-5-y.oudjana@protonmail.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-5-y.oudjana@protonmail.com>
Subject: Re: (subset) [PATCH 4/6] mfd: mt6397: Add initial support for
 MT6328
Message-Id: <173039191181.1807167.5693334391101093863.b4-ty@kernel.org>
Date: Thu, 31 Oct 2024 16:25:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_093236_754691_597AB80F 
X-CRM114-Status: UNSURE (   7.36  )
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

On Fri, 18 Oct 2024 11:10:46 +0300, Yassine Oudjana wrote:
> The MT6328 PMIC is commonly used with the MT6735 SoC. Add initial
> support for this PMIC.
> 
> 

Applied, thanks!

[4/6] mfd: mt6397: Add initial support for MT6328
      commit: 6e31bb8d3a63bb2c3efab2fb6bcfccac677a4581

--
Lee Jones [李琼斯]


