Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04460CCD1AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Oct 2025 06:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXPWz2QjbUvP+ZhaYmRd2U0MHIe5TJkZINXJqdyQAoQ=; b=nputbWrXNqv/STezLPX/QcWua8
	wLhlstK0mBEtgs6n8T2MPxFoWogS9yixXLNOapamJQYs1NpUk4jkNbKKRc2aHiGRpKBKqSk16Zjcg
	XLDoNbZW6c72b1/AyzCzDpTEVbxzyEoVYthTcQI/uEUkbGWY+CYgp63QJAmfcAOTV09whdCz5J7NU
	s4EZMju+Ct21gtp6cd13CwWVYF+Bxbj427Us8aQpfo5m25XLPnrzVR++5+SRP6hcyniuY32vhY8RE
	XO/aE/sdL5YgoqFjE4N8jFdW+79H8G4RCOAK41EwOy8Fx+EfDhFgb+7NaJdwxGLcM8e9vcm1d3IMy
	I6uRxSbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBScc-00000001iDq-3JnD;
	Wed, 22 Oct 2025 06:46:58 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSca-00000001iDC-1Vw0
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Oct 2025 06:46:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761115602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OY5eI8FiK89nDoLUMlm4zXMg31ZKUmKDZiHJGJrnqMK4av+BnVW5ryByC0OZeGNwcLT/q3wGkqH4brRpHHkiUd1m/9vCGNaK1gPQzW6fLszqOJSsfUiOwBjspbzJi4fGeqMs7337WkdfXkH8qY2M9lR09AOGLo/gzikr6G39V1k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761115602; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Reply-To:References:Subject:Subject:To:To:Message-Id; 
	bh=iXPWz2QjbUvP+ZhaYmRd2U0MHIe5TJkZINXJqdyQAoQ=; 
	b=ZwBIeZ/0duREMR6pV2Ya4Hk42PMKU22Te2lz4U8Dkp2Jb6/ZllboY4q9e7T4+unjV9XVWnH99F6/PegY0xkGqixcyQuzYqIB9CkgEIRLw3JsUHI03WqbkNQCgLab4ksk1z90pHnVRsKdV1af3Z8+lCwANG/hrY/skxRgoKzPQkk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ritesh.sarraf@collabora.com;
	dmarc=pass header.from=<ritesh.sarraf@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761115602;
	s=zohomail; d=collabora.com; i=ritesh.sarraf@collabora.com;
	h=Message-ID:Subject:Subject:From:From:Reply-To:Reply-To:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id;
	bh=iXPWz2QjbUvP+ZhaYmRd2U0MHIe5TJkZINXJqdyQAoQ=;
	b=XMgxKuCNC+tlU1KEKBYTot2jTmw67numFN2dMUMA8zxwGaOiIT+zlDBXNRgiWik8
	7X2c+hpSRrorksDoysHO2IgMfs5xuqFHvWngH6QJuAAJsmwahAXFK+51rF6ArJf9UYu
	NQ6KizUydHvMClaXRyMJ4LovL71pahDhcIdZBScY=
Received: by mx.zohomail.com with SMTPS id 176111559636163.48776361928731;
	Tue, 21 Oct 2025 23:46:36 -0700 (PDT)
Message-ID: <4240cc29adb6707005cba18c956a70ab414edc07.camel@collabora.com>
Subject: Re: [PATCH] drm/mediatek: fix device use-after-free on unbind
From: Ritesh Raj Sarraf <ritesh.sarraf@collabora.com>
To: Johan Hovold <johan@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>,  Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  CK Hu <ck.hu@mediatek.com>, Ma
 Ke <make24@iscas.ac.cn>, Sjoerd Simons <sjoerd@collabora.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 22 Oct 2025 12:16:21 +0530
In-Reply-To: <20251006093937.27869-1-johan@kernel.org>
References: <20251006093937.27869-1-johan@kernel.org>
Autocrypt: addr=ritesh.sarraf@collabora.com; prefer-encrypt=mutual;
 keydata=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
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_234656_460911_8CB1A556 
X-CRM114-Status: GOOD (  13.01  )
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
Reply-To: ritesh.sarraf@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2025-10-06 at 11:39 +0200, Johan Hovold wrote:
> A recent change fixed device reference leaks when looking up drm
> platform device driver data during bind() but failed to remove a
> partial
> fix which had been added by commit 80805b62ea5b ("drm/mediatek: Fix
> kobject put for component sub-drivers").
>=20
> This results in a reference imbalance on component bind() failures
> and
> on unbind() which could lead to a user-after-free.
>=20
> Make sure to only drop the references after retrieving the driver
> data
> by effectively reverting the previous partial fix.
>=20
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.
>=20

We ran into the same issue in mesaci[1] and have test validated this
proposed fix. It was tested with Linux 6.17.3 + this fix.

[1] https://gitlab.freedesktop.org/RickXy/mesa/-/jobs/86389548


Tested-by: Ritesh Raj Sarraf <ritesh.sarraf@collabora.com>

> Fixes: 1f403699c40f ("drm/mediatek: Fix device/node reference count
> leaks in mtk_drm_get_all_drm_priv")
> Reported-by: Sjoerd Simons <sjoerd@collabora.com>
> Link:
> https://lore.kernel.org/r/20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@col=
labora.com
> Cc: stable@vger.kernel.org
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

--=20
Ritesh Raj Sarraf
Collabora

