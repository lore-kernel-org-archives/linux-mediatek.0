Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89104C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uwWk5vwNUnHr+77nmp11wy93oHye7pIINgENe6fRVDM=; b=PCZ4QrNgMiNAG/WAAaDWErN5r+
	8UGyoQRd8CMnD2f0jq9BUgsIFRyHWwVSj/ru6Ao4JEKVuKx3cVuUctsvitq+aGwdXeS/sSjGXF+MA
	uYl7s+nZjKST1KJeZ7Qv3EpQFZ2Q08k/m/AeJZEnNpGjOztflnXIv6wrfn4OC2TFJsBu1Es44fgWl
	rhqxJ6c/KlKzj5tLVpXQxdpAMbnfCRnMj+wdSBC2bVXledkSCaMFvoiIYXzyPBbtyvt8VnrD4jazu
	EJL+GsApWHGbNkWWD7n89EQkByy1bIPKLVNjKj9s1KnbOCSjvx/hwpuV0qEb6qiTBr20myy1h+0cz
	RCcRnPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQ7w-0000000BR2b-1muZ;
	Fri, 09 Aug 2024 13:57:56 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQ6b-0000000BQbM-2tBP
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Aug 2024 13:56:35 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-a7d63fbf4afso228988966b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Aug 2024 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723211791; x=1723816591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwWk5vwNUnHr+77nmp11wy93oHye7pIINgENe6fRVDM=;
        b=ImLDM36Bl7/fgzhUZVQTkmd3JWnqXsLu2gzy0im3nvHmGTKWdKozNYfqfrTRKQyMVu
         GM66n6FMGYMvCai/xdqJi5vSWwCERrtj43fXKlA6q1Y6kMtCPtMsl6midw8Gsdv4LVXE
         1rsMuY85+lQQ80nwJqQGZB25bVf+BKTV5FITfPQkqAJlMFAxOcWgjzjXEpFya54L5kyz
         qBWV7ctpMFOeVoSNpBn7Dapa3sEvAGq/7HPJJ8Z3VFkLoOIyM1acJrnY5zzIEIzT1zi2
         a+DL2phUGmBDdHnSlMDoQqvZ7Sj5+jPt6XrHp0YIcoB4ovkoT9dfAeJy0uNFvvFRr3vL
         XUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723211791; x=1723816591;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwWk5vwNUnHr+77nmp11wy93oHye7pIINgENe6fRVDM=;
        b=EIq+P0W7mPiMJn4sCnZ3fXxB2oOpJgZ5r+yMEp0aqil5RovTajHPwT0xwkwZtVBe3d
         FFVNvRjjk9PZArUUqfJk1L/6dh6K1/qt7zySTm+mIjrg0NSvyEWAeCtBMgypkqO73RzL
         1AVpoNLnsftOmoWMuPuiTzDXTDxABb1xuNSBvKUy0vHtW0hthxBetfkcxCxdzQY3hV5l
         VD74Z2upkOH8EMdZVq9Uu7l9SVSeuWsaNM+vGCgCugdwP8AY2CoeUAGPPEyICGzFg1Nd
         G2OUEvHnYJicOEkex8FyKXpKfd5giKNBvh/RGDs3SB4iTsQjvg3SM268OPwx/cg+9AdR
         3VaA==
X-Forwarded-Encrypted: i=1; AJvYcCWqnVZR4nGcmZZSwGNh9S2Bm/ViiH8OY/ok65IPTDrhZdXCEhiRpK9rp6eTUbfjiPJUVeVF6/ePE+AyIZBN+fe5k5zS86G9Husw06k4ARXCQBl3
X-Gm-Message-State: AOJu0Yy1a/3/EJPQv4lFZjCfitckdTKo6HzInY5EVmzOgzhm9Uc8wog7
	SG8EGKf+hf6B/hYQr3uDfpKJ/YFekzIK79H4GC8FKnA3H52VbUGE6Y9OA4HZHNugxkveJPde562
	SRWbUwg==
X-Google-Smtp-Source: AGHT+IHTFysFkH00C3hYStK8EkgJdzcGP4KO954ojilgedv2Hci67RKYhM3aoedZy3R2ZJ37NGm+OqWn8ZtP
X-Received: from malysz.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:a1e])
 (user=jakiela job=sendgmr) by 2002:a17:906:3da2:b0:a7a:83af:b875 with SMTP id
 a640c23a62f3a-a80aa65fa8fmr168466b.12.1723211790925; Fri, 09 Aug 2024
 06:56:30 -0700 (PDT)
Date: Fri,  9 Aug 2024 13:56:27 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240809135627.544429-1-jakiela@google.com>
Subject: [PATCH] ASoC: SOF: mediatek: Add missing board compatible
From: "=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@pengutronix.de>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Trevor Wu <trevor.wu@mediatek.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	"=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_065633_758522_B02F3396 
X-CRM114-Status: UNSURE (   9.11  )
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

Add Google Dojo compatible.

Signed-off-by: Albert Jakie=C5=82a <jakiela@google.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediate=
k/mt8195/mt8195.c
index 24ae1d4959be..d4f320a03971 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -574,6 +574,9 @@ static struct snd_sof_of_mach sof_mt8195_machs[] =3D {
 	{
 		.compatible =3D "google,tomato",
 		.sof_tplg_filename =3D "sof-mt8195-mt6359-rt1019-rt5682-dts.tplg"
+	}, {
+		.compatible =3D "google,dojo",
+		.sof_tplg_filename =3D "sof-mt8195-mt6359-max98390-rt5682.tplg"
 	}, {
 		.compatible =3D "mediatek,mt8195",
 		.sof_tplg_filename =3D "sof-mt8195.tplg"
--=20
2.46.0.76.ge559c4bf1a-goog


