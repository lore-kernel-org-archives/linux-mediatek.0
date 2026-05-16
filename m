Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE05CD4F21
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2026 06:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwTg4sm4cNnVhMg5s/1uHcLhMcdNPNXew85SDkoB75M=; b=x9PG6zuMAqjQFjCyAfDMq8W0p4
	ht55IYCoQmL/6xHL3NtEzCQ413ytt0Uqses2teOXE1OFMW46lbfgxLGb68II84cvn+kkrL2orGQKO
	0fpw32AijyFSBC1tg7mQoxFLB1rril8817/wZus7IJn/cM5qd/TiALn0n+/KcLl4q6DfykSEMTSvh
	Ot4Ih7C/Xoj5qZyug8Fq4+eFhwrMiyO3m+cuUyroBZY34c22IHj+U8qJoftkwwllpxf0t7LuEEgTu
	06XuJtdHyC1ZRazxD1WH17ZWpR0SFkiuiFPJ1tMIEmJF7aP2vSsoToIeqiF9wb+y5XqeR5q+Pqh7L
	QcVlFxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO8O0-0000000AGKv-3Ryk;
	Sat, 16 May 2026 06:20:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO8Nw-0000000AGJd-41EH
	for linux-mediatek@lists.infradead.org;
	Sat, 16 May 2026 06:20:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43d734223e4so222182f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 23:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778912426; x=1779517226; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iwTg4sm4cNnVhMg5s/1uHcLhMcdNPNXew85SDkoB75M=;
        b=UD54NxSoGqNS33AewFHNnsTeXEGKv00Z2Y/XbIrNdrLaNMhU2ZpGPYBDTgNX2BMUHi
         /WL/1SOvas1MITYk5uiOGttXPtb9419CsIoN/rvPSj4fDfqMDKOgeOiF4slu9SE3TXbL
         ShEy/OS9eswUHE1oVUwpRQ86KMC95v2QxD++sotFiGylnAxSpsrG75s2RaJZkwsjZONY
         pWn4XLjDPaZkEk2kg+JbhabtPgCA+Z1m7tVPXBxKWq7xNPkJPNvNPSZCHZ8wSUD36gSe
         Ztv4Nsxl8JN5/7Uj2g231C5xOEVF34dzQJylcvZKrEFzLcI4GGRzYfU7tAy0UEHvQhdY
         tX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778912426; x=1779517226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwTg4sm4cNnVhMg5s/1uHcLhMcdNPNXew85SDkoB75M=;
        b=AjoV1fzWJKBRXTgLDjplMn4QIitTyMt1QcyQrymZt5f6Za0cd16oXiuCkIEzqr9Zuc
         3DN/L2H32R0iSlHrn25DYk0hCA2NI9uKWFnIK80vh/WUEn2aHWrKQF1YfIf29uuAv+tu
         h4KJfcgRUOE8UylDcqLBVU+14qX9A1o50J5n/KyRPGwgrAQwQ8Hes+K1lSq6srUb+OHJ
         eALXlkYTYRxmIBmWfJrmEwepOU2yinUrddzdW+54ZhCYKTxg31g6igMoZZASNz1SfPz1
         dgYaCS9NQbKSBEZw6LO/M6uzW2lxIRBIbiPLdrSbVLNcT/zqhovAiGZ7XZqnNQucs9fL
         Ks2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Yeb8zk3xM/dKepzSuSZgYt1bMucvJ24rEy8Ui+Nw2kwILcP8ywDF9oiO9cDNGrDMAj6UBGUuGgCCK8KOw0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz93Q9bUF2XdFR90VjwbBOLv9vIbdpxsgZGEswUqrVg4hjTOdKp
	H6QmJH+2MeAyPBcWjgaW86aRcCBoLolLrqqZ7ZBISC4BaanzWcptxJSpLen9NkOj8KM=
X-Gm-Gg: Acq92OHfoDe2Ii6r3ojr9KrFGTendcjtrBn/1ohzwsysr0iGNLgo7AQf0SrHn/kMDhN
	7Ta0VufYnY9aXQsC6f6Avskpg5guMxhn7oKKemITIpfTYPlfEYmGdo+nyLXOXjI3euk/6VI3MPG
	rFp8d2ySzSECD5iB2+WTovxx9todwBFZ2ZPBWjzTjPcAWkrz2j8kG++7GI8Q4rtrGPJ+3MAI87W
	8oMN9SUrZ0+YQrV1sdcmu0by7SrBTPpf5HgemwNSDF9NGxGl8xkwjdNZcwDqXojKp14pGVni2yz
	9eG3iSyolTcqUjsEMmT92b470gq5Pbvguz5POZjAsDFFvCpeukfylw3ACIStLLR9PNYUIQUoZx/
	KMBfXvBazMTsqFtpsuMRUwoWUPtOYh2nI30NBgNsgmn8hzv5SjSxr3M49nltReae4yK9CZyMpB+
	zhEY1nDd64T07GmJeJ2XIn+spcYl4Aei7NUt9w89o=
X-Received: by 2002:a05:6000:248a:b0:451:259d:83fc with SMTP id ffacd0b85a97d-45e5b886085mr10629272f8f.17.1778912425850;
        Fri, 15 May 2026 23:20:25 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9e767d16sm20858858f8f.6.2026.05.15.23.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 23:20:25 -0700 (PDT)
Date: Sat, 16 May 2026 08:20:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, 
	Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, Peter Rosin <peda@axentia.se>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>, 
	Kevin Cernekee <cernekee@chromium.org>, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Marco Crivellari <marco.crivellari@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Aaron Kling <webgeek1234@gmail.com>, 
	Teguh Sobirin <teguh@sobir.in>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, Hsieh Hung-En <hungen3108@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Shimrra Shai <shimrrashai@gmail.com>, 
	Zhang Yi <zhangyi@everest-semi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Qasim Ijaz <qasdev00@gmail.com>, 
	Sharique Mohammad <sharq0406@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, Neo Chang <YLCHANG2@nuvoton.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Kees Cook <kees@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
	Tim Bird <tim.bird@sony.com>, Bram Vlerick <bram.vlerick@openpixelsystems.org>, 
	Peter Korsgaard <peter@korsgaard.com>, Linus Walleij <linusw@kernel.org>, 
	Wenyuan Li <2063309626@qq.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
	Xichao Zhao <zhao.xichao@vivo.com>, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v1 2/2] ASoC: Use named initializers for arrays of
 i2c_device_data
Message-ID: <aggL5R0PQq9AtpaZ@monoceros>
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
 <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdeitipt6peg3e5c"
Content-Disposition: inline
In-Reply-To: <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_232029_027727_10883835 
X-CRM114-Status: GOOD (  16.17  )
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


--qdeitipt6peg3e5c
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/2] ASoC: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello,

On Wed, May 13, 2026 at 07:23:04PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
> index 9f40ca4b60d5..df438baf05dc 100644
> --- a/sound/soc/codecs/max98088.c
> +++ b/sound/soc/codecs/max98088.c
> @@ -1722,8 +1722,8 @@ static const struct snd_soc_component_driver soc_co=
mponent_dev_max98088 =3D {
>  };
> =20
>  static const struct i2c_device_id max98088_i2c_id[] =3D {
> -       { "max98088", MAX98088 },
> -       { "max98089", MAX98089 },
> +       { .name =3D "max98088", .driver_data =3D MAX98088 },
> +       { .name =3D "max98089", .driver_data =3D MAX98089 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, max98088_i2c_id);

The indention is wrong here and uses spaces instead of tabs (with and
without my patch). I squashed a change to tabs into my local commit, so
this will be addressed in a v2 if it comes to that.

However we have:

	uwe@monoceros:~/gsrc/linux$ grep '^      ' sound/soc/codecs/max98088.c | w=
c -l
	911
	uwe@monoceros:~/gsrc/linux$ wc -l sound/soc/codecs/max98088.c
	1780 sound/soc/codecs/max98088.c

so it is probably more sensible to address all these lines in a separate
patch.

Best regards
Uwe

--qdeitipt6peg3e5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoIDKUACgkQj4D7WH0S
/k7gSwf+LrTVzNblQTOa3gnZeorGIhj/sMcspAYhIUmYPDtnfBoWNBdCLZc6K4FS
R01MPMG067BmfqLJWRVfIPvDrqvTXZEdQbCLfjh0uwXLX6ljzIR6zyhUCXgUcWQ3
u+eHDUCfsppDqVWerbYOIvYuWjiwHKUnrwRhAEzSVdM8thodBh2uJA16VChPQQP6
MjmDYEtytpJ0azMDrGVj0bVo026970Cd6YS4CKLe5vtZxIIqe+Pcl9kto1IPib6V
4A/u+r7xWwgcgwFWAsFDp+hXP7cWWZ4UWr+5K5Yryn1oUh0dRs3OEtG3GVOoDzD4
9is+wvNpU2YideeLn4AUYPLz3Mqh2Q==
=EDAl
-----END PGP SIGNATURE-----

--qdeitipt6peg3e5c--

