Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67449CD1294
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNbhJRBIiklc6TfS4yB8wZ2P2EAoGPe9N2X+15BCKe4=; b=U3v/UDrKFHd31Jog82Zhk0aOvm
	PQJ6Qf3LtTYgLIypIemftrdPJqgPy8DMvzujHtPgMljugNhVie5VDuAmR8PNOhVBjimFNw9pF9Vhq
	EsBL/HH5bK6jA7vmxxfg+L8fpMCkSBXaA5IBq0jCEoy4VrjpvnslGiYcMb0rWIhuWfKhklSQ2Ihgy
	xEZIt6FUmPyrOpXHfY5uaM4/iDavMpuLeYBHqPzmfnVWXhQqzRQ+wDouA6vr5bikqzVtSCCIzqhj2
	83cPbXeITRH08opSJP9x0yB65b11FQQ8UjlB+yrR3FeX0SSAgBnbdmg+mrt5jD5wobfRXZeLX5Yhb
	MWgop7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxu0-0000000FWiy-2pB4;
	Wed, 03 Apr 2024 10:31:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxtr-0000000FWcT-3yYO;
	Wed, 03 Apr 2024 10:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712140281;
	bh=JuSZGXontp1uaYFNzm+IpjhYl/FHDLiUCjatgpsESdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SkHScl5u+fybKvow/PSCZ/LAxJg6xER5pcBDkb6a1rl1sdwU3MWFXCFRSb7qEIp9O
	 eW/rbU3QMdieM8rBXTb9ljgDIm/QFmwMwBZvkLO1FZAdxhXCfytWo88FPj/jS6SqBP
	 9XXDiGWNg5mCRWai4SWc7XrDsHt52GK64jX7qbJaPNL3nJzsALFh8kkwnrM9PUbjSE
	 soBYuNGMmHfvaxGEjy2J5RZHb0twOReXLckK8+YGo+p8pjDSCdOQwwWuKYNpacKhQ8
	 pzzQEbf7BQGgSqVUECse4upNfmo8WEkPYY2pEmmYm1b6PJ+YDKoVFo1yPQ7WOXGtqs
	 rqKhrkF8k4dOA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 31B0D37820F5;
	Wed,  3 Apr 2024 10:31:20 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	"Nancy.Lin" <nancy.lin@mediatek.com>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ikjoon Jang <ikjn@chromium.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Enric Balletbo i Serra <eballetbo@kernel.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: Add power-domains properity to mfgcfg
Date: Wed,  3 Apr 2024 12:30:57 +0200
Message-ID: <171213179798.60933.2204877373664709221.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240223091122.2430037-1-wenst@chromium.org>
References: <20240223091122.2430037-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_033124_212572_9A9AFE35 
X-CRM114-Status: UNSURE (   7.50  )
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

On Fri, 23 Feb 2024 17:11:21 +0800, Chen-Yu Tsai wrote:
> mfgcfg clock is under MFG_ASYNC power domain.
> 
> 

Applied to v6.9-fixes/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183: Add power-domains properity to mfgcfg
      commit: 1781f2c461804c0123f59afc7350e520a88edffb

Cheers,
Angelo


