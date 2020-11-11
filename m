Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0713DC56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 20:28:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8561A21534
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 20:28:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1NmrdIZm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vee6Azj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8561A21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=69L07MptHO8bGBYCGH3yKEl69dHKXQ+8vWzO46Ys8Fs=; b=1NmrdIZm5twojm/dXQXV8V35N
	wcC6ctjnqRoR4MSyeM+3JHxzpTFDxiZ6BmQcWqXgdbJHfvJ/jRVGkDGtLKWIBgjH56hOsEGGpA3Xf
	QBCxoKEC4ZOT83aB5yZ7rz/xkugjTA7Wg5bfnqxo3isGy0UxB8BNHhqakMkyqTzavk1v3SjDd3ZmR
	r4Mmcr2ObjJdwekFEIZn3B+yJLFIGfyWQZWu6As0gTsPGjp2wj0GJQWAKFcKE/djRux/+TOd2khTw
	vJHCkkSczY/WxD8FSqp6aNe48ggJcVNz5l5/8FGgC2oYLfR2TO1kEkG4cNUflHPgWNUXRrCkpuSmN
	I45wQFdCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcwjS-0004zi-Tz; Wed, 11 Nov 2020 20:28:43 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcwjR-0004yv-38; Wed, 11 Nov 2020 20:28:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id b8so3822009wrn.0;
 Wed, 11 Nov 2020 12:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dq1iKAU2y96x/XQs698772mOxdQZDghPuWoC8s03/bw=;
 b=Vee6Azj3MPC+lNFGsKyyzJX6KXFIYdm6N09bdx7crsRVNDUfilZNN5wmgMv+Gkf5im
 GA8cQnzHNBLG9FdPOg/FmfG756jZrnd6UQRudC6L2/krFmDxhGOXyIo9Ngm1qZmvfsBO
 5pUjqgNa/9C4+ZuI/gBrqGhyOJwGWJvn5UxINyg+341mT00DRfPLpZ9lz+QB0gnKwwD1
 MvhqjhWfcej7XHHfGPQZluNtXycTK0BpL5r6pg5CnJphHfRyMzlanaHEH8zSzOlqJszP
 qczNOgYGlluk/YVMZB0KTm+QKuFSxkI1xHfkjGFoMBi0XIupJr5C4bltNS7tjSDUczuf
 fgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dq1iKAU2y96x/XQs698772mOxdQZDghPuWoC8s03/bw=;
 b=rPQYgqK0JlV07WyVRIQGak54Ft3pydVcWm23nrLxmWWbZu5Gh8rFnD/z4tvcymJ+LV
 7UHUmFMa4of1CXP/5KTuZKr36sHglA90s7Jp4MvM9/kQ1RSq6s1klRRlh4N5vtkVR1Mu
 LlTJJwF9nApthRbZ/CuDWTu3uGyRmi+lEV9gwcBahImiwOuQHU5bPpeNwZdGhW9nhQ3d
 YhUhxdxqNVwhXUbPzuV2EmPeLBo+6e0Gh1GZlg0D75FZcATOTgGcu4pXAny6wpg5YJmn
 lr+WLUOrXYKfhrG/LsZxkGlnYaZRwK9Ilo72gz34oGN6CmO/OBo2AsvTc7VBmCHvTykR
 xqcA==
X-Gm-Message-State: AOAM532tVGnhlLcGfX0lR8HPYCA8hnnZwVoHGUZsv3+lKv0JNF/PTmVL
 OqGj0IYpz9bMPibzDpbCTmM=
X-Google-Smtp-Source: ABdhPJzZrzzs5rxl4/NxB5wuaLZ+aEAbGVJRfd52NF6xI7d+W7/8g+JKGdkLEqeHfMN2QRHRdyZnlA==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr33910986wrn.56.1605126520242; 
 Wed, 11 Nov 2020 12:28:40 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id h15sm3763351wrw.15.2020.11.11.12.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 12:28:39 -0800 (PST)
Date: Wed, 11 Nov 2020 21:28:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH] dt-bindings: pwm: mtk-disp: add MT8167 SoC binding
Message-ID: <20201111202837.GM6125@ulmo>
References: <20201016185015.3371433-1-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20201016185015.3371433-1-fparent@baylibre.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_152841_169789_A93E50DC 
X-CRM114-Status: GOOD (  13.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1783691633477413248=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1783691633477413248==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EE8jvUPYYQjJtG7J"
Content-Disposition: inline


--EE8jvUPYYQjJtG7J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2020 at 08:50:15PM +0200, Fabien Parent wrote:
> Add binding for MT8167 SoC. The IP is compatible with MT8173.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--EE8jvUPYYQjJtG7J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+sSXUACgkQ3SOs138+
s6F1NBAAvrQ2J8Mkjdux185RLd+NOTmlzziiX62GKq88ZnjDlAN1G3GFuigUiz+6
eQYOQQH/eP+vBT9T7g9euUgTkZg+Ve+a4RoAMJp0NrNsjCsAgj2wRqLiKQtxCllA
8dDhgeVcehlHi0DXQvM5LEWNXN+VtBaMx5nrhSsY31xHoAeHVK43zk4ErWH2878w
47S2iWwwyrcPqELQVm7NpfoBY01y0/uA8oL5gKdI7CNGpO3Q81KHDgP5HJW9/FZG
Z+zXAWJae/ACqXSbmh9Yf6t+NrksvyQP09pSb65yl3BkCqks/+UncHzlXMXwHfZ5
d7xQei+anY9Pm5qhxk8EpK+BmiwDqAJ9gV6mGOfIiHCGmqNGRTgQJ7O8354Y4sLC
XFdQzpw+DjsR8iYO1q9tz12mrG+8bFxvdRBKo2B8A1Lb2XlK048NkdD+htGDRQP8
TcOtitlHoNY31csGzrO1Kvm3gPkhx85Fs9kCaOP5KrHu36JCBTXYkcVU3KhXEDzC
MBCasCoSQt3NhAWfXNQtU0PTCLiYJ2L5kDSrIJj45bbNWPn783ot17fscot3KMKL
Unz9peWjuoV7nHj2B6reK4QZr8+Z/6sTQge+wKE0EsIYCChezQ3Df94fL5BNHs7d
EFrd880F0IvUMag3eUJ3Yso8ZDbuQcGiKBdDH125EYGPu+Oj9dQ=
=dTlx
-----END PGP SIGNATURE-----

--EE8jvUPYYQjJtG7J--


--===============1783691633477413248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1783691633477413248==--

