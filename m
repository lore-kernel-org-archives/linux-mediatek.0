Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 04:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GhCtRbsiI+rR06tvJbGM/yYhZv/vLAycFsh3ekAamek=; b=tAT
	hiY9hlTLWfsAlThWt4ZwPmUvhRkPursOyP+eW4K8wVQYHd+8Ip407753ghg5DIlPxQVtShw9Wn2+V
	BFxV8VMKKZ6EbmKqi+7Tz8T68O0v1xJQ4c9KY+cwwLWGIYb+zPOVo71HIn3Qb2/UrQ8mzF+SeDuBj
	K+iSVIN6ngmJ/whj8KiDuurVRpPfCTIlJ2s2yUctQdF0aWhFc7EbsIEEvmYZsbRi2AxCOxGwVVccO
	oIhk2mdchAfOGkN9bZPJ3aciPZqqnSAbPIeQZmZhb8D9mJZMk3kHdXQLNitXGUq+hGbUTqEFsucK8
	JzNx94MA9CUakNeMrvbIWhBmIDHzByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwyzk-00CTyU-RF; Tue, 14 Dec 2021 04:00:52 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwyzg-00CTvM-LY
 for linux-mediatek@lists.infradead.org; Tue, 14 Dec 2021 04:00:50 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 t1-20020a5b03c1000000b005f6ee3e97easo33863040ybp.16
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Dec 2021 20:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=gH6VytNCcR/663SuXLz//aT5v81QXOOZ77y3idOPjPI=;
 b=KUYS2WNmggkO20Zmll03I/4/wpE7LncoJnK+g8c522aQ0VOShYg1J2Zo7mtzyNtyfZ
 7O1vdzMeRIzfVqbNOx79k5MrU00AsFWLDP+xAhU/26ztWIzyuPUDq6okL56jpphkJO64
 /k5O16IEiN8GX4DB+CuYBrEW5FWA0XkheykantgllsCRhOcKIm564bkQ57pEyMbVAJ49
 UZyN/It4QGdOC/f9Suqq/S2kqJ1BWqGM+9eU3eeVORznoO7+N3x7fdE0WoWptYJklfyH
 dliehqZjJWM8NEXPHDlGSmxOKD7qClfbSeSVgiXVFXQtEvTWF+2bQx1YT1QOevXM9s7h
 +I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=gH6VytNCcR/663SuXLz//aT5v81QXOOZ77y3idOPjPI=;
 b=yz0wk+btQ3d9/3UCcu1O1NWTas+pPEFJeELSu30lACAlYU43DhRFoqc44SpvxaPkdb
 thUzI+5qNkmoR8UnFW66xlcx7B6XqyNxbDWA5IwxsPpoHqnICcODIhFvo324C0t2iwJc
 8fNY7rCW2vAI8biUjVoObBeZQLy2SdEbB9z+rTgUKkn0wUceaSkk/lbvcIJw154/ETGZ
 oMZdMl7fM4TNbZd+MBANfZSo5SxFoI/UVLI4e3f0AnM6R0iKxdBADoeU4dtvF1/U5ptC
 nlqaWY7PKlyxag4OoKWK/xkpUOcNAt8SLAoaVVzFnvpFVF+8xpK6nL3FOI9fuApQc+9g
 mdqQ==
X-Gm-Message-State: AOAM533YN9PVtvGK/2wTrRFH36ufAzaKYQApJsZoHZp5OneTqoUG5H9z
 XL2lgACZMbqV++zMwW0qEe/MDZNuxHlF
X-Google-Smtp-Source: ABdhPJyJ+gRaNjgJGy9E0cHpu//789P5n3ECAFBUIUMkhGjSQmSpj9Wx6BMCctlIoRSkXsyJkLWIz/+9b8rK
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:16cc:acbf:e9c5:6393])
 (user=tzungbi job=sendgmr) by 2002:a25:7489:: with SMTP id
 p131mr3067762ybc.339.1639454446238; Mon, 13 Dec 2021 20:00:46 -0800 (PST)
Date: Tue, 14 Dec 2021 12:00:28 +0800
Message-Id: <20211214040028.2992627-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [RFC PATCH] ASoC: mediatek: mt8192-mt6359: fix device_node leak
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, tzungbi@google.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_200048_732456_BE4EA114 
X-CRM114-Status: GOOD (  13.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The of_parse_phandle() document:
    >>> Use of_node_put() on it when done.

The driver didn't call of_node_put().  Fixes the leak.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Hi maintainers,

Need your comments.  The patch is one of the partial fixes that I think
it makes the most sense.

Option 1. Machine driver makes sure the object is valid until registered

This patch adopts the option.  It needs snd_soc_register_card() to call
of_node_get() somewhere to hold the reference count of of_node.  However,
I failed to find similar logic in soc-core.c.

Option 2. Machine driver borrows the reference count

This is what [1] adopts.  Decreasing the reference count in device's
remove() to make sure the object is valid for whole sound card's lifecycle.

[1]: https://elixir.bootlin.com/linux/v5.16-rc5/source/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c#L1065


In fact, in my test environment, CONFIG_OF_DYNAMIC is not set.  The
implementation is empty[2].

Per [3]:
    >>> Hardly any platforms need this

[2]: https://elixir.bootlin.com/linux/v5.16-rc5/source/include/linux/of.h#L125
[3]: https://elixir.bootlin.com/linux/v5.16-rc5/source/drivers/of/Kconfig#L55

I am not sure if it is worthy to find somewhere to hold the reference count
in soc-core.c but I think option 1 makes it more clear to drivers.

 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index a606133951b7..24a5d0adec1b 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1172,7 +1172,11 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return devm_snd_soc_register_card(&pdev->dev, card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+
+	of_node_put(platform_node);
+	of_node_put(hdmi_codec);
+	return ret;
 }
 
 #ifdef CONFIG_OF
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
