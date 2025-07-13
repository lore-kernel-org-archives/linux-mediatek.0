Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41068C83F1D
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jul 2025 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8l1uZ17d5krCHtbYqm9PDoWYLxWOwX4gFpsp2HGkHo=; b=eDWM4cF/lToX6H76SnpY8oGhWa
	bg7VrTAiivSNXji6ezQ5L8EiJscGMY6CxXjIuoJaKeiq1XD0LjGv7Ds6aMAJCxzj9xZpMEjl9bJe/
	zg72crAPj24AaFYvzjSiYqdCIqDFPt0RoJQzIPIYKjYiLkv9U3hfD15RByQUAL+68DsITvToDaYq6
	JiPYNF6DLXiqPkePTpmCYtZuBoq/eJVbtVrV1BAQ127eHyzUHKEXkcTiSIG9QAlYvpztZwacYXSVG
	6zN1kYwI63MMVz3wFpdWHDCcnuZRkgJ8GxVZUSZAW5XrLIAKgzCxY8/cu1v7BvHBbHWpjhEOJo/N4
	3alJ8mdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uat1S-000000000sI-3dmo;
	Sun, 13 Jul 2025 09:29:26 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasPe-0000000HYie-1QaE;
	Sun, 13 Jul 2025 08:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=z8l1uZ17d5krCHtbYqm9PDoWYLxWOwX4gFpsp2HGkHo=;
	t=1752396620; x=1753606220; b=kjB4UiYkTK2OBH2K/FiHrE6gRddigwZFVmPV6Ny23mZ1MTI
	sDZjoos+eA6EMXibE/nzOd9Ka9lKWHh1ndnI8diwRb+wlgNVR9hq6Hpww47Y6uYBRwoea5CP4UzTk
	1GjZdH0l0gGOIvQXQnk39Kve1wmm+oz51qnr2yrwhUaamj5hMNk5UV9ESAhKDfXGWdP0sT2GBRoOK
	124SkBRll2t4Vx/xE3SK7soT6jOBAY6CVINNmVEvd9G9OcFOIP6vUryX8sNvWyVoyjd4TKo72ZYWG
	9u02oCO2kGzj5fGsgx3aB1ZioRj+Gw8j/nBMV2nRL4uP2KNxX3pWtwxGRMArE7kA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uasPF-00000001ria-18EG;
	Sun, 13 Jul 2025 10:49:58 +0200
Message-ID: <36c4cd5f263e4bae22a1779a9befd24dacd5d3bf.camel@sipsolutions.net>
Subject: Re: [PATCHv3 wireless-next 3/7] wifi: rt2800soc: allow loading from
 OF
From: Johannes Berg <johannes@sipsolutions.net>
To: Stanislaw Gruszka <stf_xl@wp.pl>, Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas
 Bogendoerfer	 <tsbogend@alpha.franken.de>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS"	 <devicetree@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>,  "open list:MIPS"
 <linux-mips@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"	
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Sun, 13 Jul 2025 10:49:54 +0200
In-Reply-To: <20250713071532.GA18469@wp.pl>
References: <20250710200820.262295-1-rosenp@gmail.com>
	 <20250710200820.262295-4-rosenp@gmail.com> <20250712101418.GD9845@wp.pl>
	 <CAKxU2N-RXgFKYPAqEu3iZDMAisj_K-b+ZZTGFsabWz7pMK+02A@mail.gmail.com>
	 <20250713071532.GA18469@wp.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_015022_404604_09CF813F 
X-CRM114-Status: UNSURE (   5.49  )
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

On Sun, 2025-07-13 at 09:15 +0200, Stanislaw Gruszka wrote:
>=20
> Can be done as separate patch since you already
> posed v4.

Maybe I should point out that I've simply been dropping the patches
unseen because they don't even apply.

johannes

