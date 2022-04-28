Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB699C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YucACf+QXZFBF3ROn6kkcM04HftQ2I5VJkeVcP+9rvs=; b=ma0r65JfB5eTc8CxEU3Zh7Ugr5
	pEzj55BducdN2fpzeZ9/Nm2IqxrHLuTlv4zD6PmE7fRIYsNBHSqM2CTIfq+jM8sRZbJP0/LCuqyea
	cQtfl09bbVlSUy0WsDMLVIwySVSg3bzrpBdikUlGHTq3aLqoNkizR4/rkmq8RcAt+BOzf/QSC0j2T
	a0TkmxefaV97J6kZ42SRAB7A7EzjZZnjBq4BqWFt5ZWgXXtq48VzdWZkBKAYlG/xqYKYIrARMY0Pq
	Y4oDo8pAuuP5kbSqI6zksUpBT34I03Kyp5ui75ukkmBbSYvRiXUuNRzBE1YgYuS7F5gBcXHxMsk6q
	W4TCqISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk38B-006mp5-IM; Thu, 28 Apr 2022 12:20:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk37e-006maE-3L; Thu, 28 Apr 2022 12:19:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98CB6B82C96;
 Thu, 28 Apr 2022 12:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EA2C385A0;
 Thu, 28 Apr 2022 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651148387;
 bh=0ZF7rbfOURu9fFQScLsiQBow2Dp0oWt4z38KgBEVbyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RqPNCacM155R73rT1xOj26j/PjnWU1BXlCCR+fgYHwmP6pAMyuA+qIPZhfNq50dbF
 Hqi5elhl8jrh+4pjB1DaSTmiNMRnjVoz/zO6fLCu3R4HrPrtNNskRIltHnmVgCh71n
 mLB27rM9gvH9guv4nsUV35OSWd2QV0993k1yu8A8SgrpHjaMdb35bDh1/7zF8eb76j
 CopMvriSjfhzOzhzavCS63LS2g5Mh8uIL/X1yS8TctGAI5VnIBhVmuWwpl5WHmEwcS
 3RIxqZnWcz1fAD66e6vhNGq01RmJpcHvLKpqMEn7/GwmhFMX5v01TIVcbbnl9k/CaF
 mZYWEGTDD4+jQ==
Date: Thu, 28 Apr 2022 13:19:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: robh+dt@kernel.org, angelogioacchino.delregno@collabora.com,
 aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v4 00/18] ASoC: mediatek: Add support for MT8186 SoC
Message-ID: <YmqGXCg97X6Vqvs+@sirena.org.uk>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
X-Cookie: Bedfellows make strange politicians.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_051950_352624_67A3E05E 
X-CRM114-Status: GOOD (  13.24  )
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
Content-Type: multipart/mixed; boundary="===============2753428686350977219=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2753428686350977219==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="14HuojlumyrWt7WU"
Content-Disposition: inline


--14HuojlumyrWt7WU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 28, 2022 at 05:33:37PM +0800, Jiaxin Yu wrote:
> This series of patches adds support for Mediatek AFE of MT8186 Soc.
> Patches are based on broonie tree "for-next" branch.

This looks mostly good from a framework point of view - I did notice a
few minor issues which I commented on (some of the control things are
repeated in other patches) but the overwhelming bulk of the code looks
good.

--14HuojlumyrWt7WU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJqhlwACgkQJNaLcl1U
h9D9DggAg16/opdgBxLyrYeeiZua8OPPegaMglo/X8k1DiCR0BudGSgln13XMg5i
gmLRcCIr6/gI69T9tIdarki2mOqMhdyZAjZtLsL8crocPPM5/pkuGF9lFg+dEyWa
Hl3ipVQEKqxgtSSRelBtwZbT6N5tvVNjQkV1R0+376N/jbtS4gUa3wcs6weJhCGz
7Zo6/8FogQaAG0S/RkqiBRAOfStCbJl+33rN1nASR7mZJHCsu6kefxdHsrtYJKq9
VqQtzDPI8wfHaMhJ/cFidSWVssQD2Uoyea3/Fk3I5YmHvnM77gIB5taZPeAlKQxh
9Ofv/WaTnH7gZHg389wqh3jxMnUJmQ==
=bwgG
-----END PGP SIGNATURE-----

--14HuojlumyrWt7WU--


--===============2753428686350977219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2753428686350977219==--

