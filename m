Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BEFC072A2
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 20:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX9WoOacLDigRvGbp357tabXuA7DcFEvIQHKWbMNF6E=; b=mGf6TFxZuqe8FiAcvaDcx+r7hJ
	E7Qm+ZT0OniFboqZNnYw06OG5G/14+HJKDfgpUllxk8r9YQU6rmKOahecZBKlfGYwmI9LrbFda7B/
	8H7+w0UNKdUaAIZX1eWC50JMEtwGY/eTetQSiuVAKTQxv6c7symxGp1LVRukXPHDGjxNLSie+JIBj
	Icqali00sDPMgbpBxTjNju8pzaw0xtUR0uOzak3AZHBjj4adjaOyo0mdmZ1CUuPSQwPKFYF5VmpuS
	CS5xkp1nP/Mp7G7sB4oTpYNBIp/lN5GKLBjd0p9LJwQXi16fFUnl2kDfF4uVd0Wjyw6VUXlZNC0kU
	g7+58VjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dxc-00Ehvf-2O;
	Mon, 13 Nov 2023 20:55:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dxZ-00EhuB-0u;
	Mon, 13 Nov 2023 20:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7885F61012;
	Mon, 13 Nov 2023 20:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF40C433C7;
	Mon, 13 Nov 2023 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699908904;
	bh=HX9WoOacLDigRvGbp357tabXuA7DcFEvIQHKWbMNF6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQaTqPxspSv8+i8SRdoAcGMGMJWmklQSt2qjaNXA1AMMlyY4c9y0uPRZK6v+driu+
	 PZT+8PlAO2Y0ZIVoKK8JgZWgb0r8FLC9xdYQbyV55NWfJegLb+P+AzXpqSAfuGEYVk
	 jObnlArfM+YzkpXwglUhxc39+XcVMAtVnr3jumiMlgx6fV0Mwxkg3LITDyNZ3DlLif
	 r3gn31aLtJF6maVADxUQ9qAFTgxLc6nkrFcZIFAmg5OyjUklwyIl7Q+ARPC84LaNHV
	 OSBqemaVBcAVWDerDEV+U8L7AyhIYpsVj6XLOGuIlymBEcxs0BenFcnsFiYriMqW/d
	 Q9OncnEY39k2Q==
Date: Mon, 13 Nov 2023 15:54:58 -0500
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
Subject: Re: [PATCH 00/20] remove I2C_CLASS_DDC support
Message-ID: <ZVKNIn1eSlZ9yzco@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <ZVJhwSS16+/Zzt0f@shikoro>
 <887657ba-86ca-49bc-b6c3-8543610c3230@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6QEpjAXU69jL13kX"
Content-Disposition: inline
In-Reply-To: <887657ba-86ca-49bc-b6c3-8543610c3230@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_125505_407562_15B27A8B 
X-CRM114-Status: GOOD (  10.33  )
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


--6QEpjAXU69jL13kX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> We're not in a hurry. It's just my experience with patch series' affecting
> multiple subsystems that typically the decision was to apply the full
> series via one tree. Also to avoid inquires from maintainers like:
> Shall I take it or are you going to take it?
> Of course there may be different opinions. Please advise.

Ok, then this turns out to be a negotation thing between the drm/fbdev
maintainers and me. I *can* take all the patches, of course. But since
the number of patches touching the non-i2c subsystems is high, I'd like
to hear their preference, too.


--6QEpjAXU69jL13kX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVSjR4ACgkQFA3kzBSg
KbYBGw//VUbVW9+Ixe9HjIJ3HSfBWxKVxRlhYfBmhO2cE0q82ZWNtXn9KLCRvISh
gZrYpOYKuRPodc9sB1e/Rq02rg4ZUdVslMIs6CARXyHkijz+WjIqexT7uMjM4hVr
8cQfVKgr72AbhCzzD8q1g5KIYbnwkeS4NDPc48YYKs7CgpRsCfBaisBvbCCEZFez
oMVUyEqNtFOeBht//TldZh+lhRVBw8fIEUT2/y4pYtuA1gFAsD5kFKu1JkYRn9uL
WWb9mRIz2ybsmzlxda1ED+z7YegeV6yaNQahG++hboHcVEhYlNeWbCx0few90tpb
8AuP1ArLT8SdvOcYHLRBzcE8C94fpichL7IbfZGeHr74DJSehuD5huLHC6WvcMsR
9A6eW3D82gAa+SCgUFpndu82NbVtBrqOl06BdQpARQZ0sqvQ6SMGx2Vvd4LgKGth
tKnNU5kH9Q1eP04Pn1dJQqHgJYjsA2eaOG5GGIcuZHWigWZIUnYrOpTVKvChlwJc
UV3URepN9RiQ7aOMB65NcBLJ/FSEe02wSE7uLpu7N6G60RaKPFMYPE3hRKjyCXky
/9iJ4EB02vBA2xbP8lV5ZXdxrPv752oaC9kqNnsb2JrmOULiTgXnDanBmSHvtQ9n
o3AwiwXfOeWtBA2twxpEzqOcc28pvOFLTAWBcjgPVsUDVJP8mgE=
=HpzL
-----END PGP SIGNATURE-----

--6QEpjAXU69jL13kX--

