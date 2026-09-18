Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A80C982D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=; b=yg/7d+kzazi4KNO7ibkYfccf48
	WJFHLgivY/16oDbVVZyNhTNlVr+reOPYeCDPOe3PJk1r+sJmODEPcy9yEaaRL6Gdn4p1bCeMGdDHd
	GDvJdxpj1axAIiiBw+pfI1xSzJP8grYvvYcbdGgcLIkTQv0YIjmJCIp2elHEMrrxwOuCgobTtkD9A
	ecOdyYIgUNHRAtRDKLJK4s0mgia3PowIfzLjZXpVQVIaCSniXWTdHTflduGGtCdOnMUTxrRxYT5po
	Ho2wpQY3Yj7p2EYfy9MwRPaVX+i7kTbFaFri5VxkWCw98h/t3hMmB/ZeT0+Px36XeZMoXj+uzE9sA
	XD2eqZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ODA-0000000DIMs-25Wz;
	Fri, 18 Sep 2026 02:20:24 +0000
Received: from mail-oi2-x0a.google.com ([2607:f8b0:4864:32::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OD2-0000000DIEz-0GqK
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 02:20:18 +0000
Received: by mail-oi2-x0a.google.com with SMTP id 5614622812f47-4c3bb46aaf0so125464b6e.1
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 19:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698015; x=1790302815; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=Gkj5sbbXeGj4bGinZ+bkkox+xvxO8k38WFbVlxlUVxy3rphrrVS8WvFGc33xsx44CF
         JAmtJpjF5VdMieLRa9Pq+4am5D8JlXy5pbNluFroBNN+sTTKABgM0XV8NPlMZNmbtiqE
         IFsXAqqIeCeOgtZDpy4Thgvrhl6Kufc6FHNoK0u7SNo3nRdQIJPo23f5ONTR0IqvyEZG
         DITTTkF2SVT/KjWJObOm1MRsAZgqVm369dcGouqU8OENlo+1u9ld//SuPy+/NB0fZtKB
         vypKFFb7MVKLhBVp5IVtPEolIgKsWT5nTMGJ8hK7MrwEpvqaZqAZomXzV+IIdK6nrTdP
         JbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698015; x=1790302815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=bM9kVoMHKWttMs3yhtjR6ziVy8n8EBXbJBQSbulEfybilbHWIKi3ja4b05YV0XiRrb
         Bj3PQFaPn2990GHbLP+UqASFyhsMPMb+hF9WMr2yniLZK+nrUvBygZbpwMys+JJQRS9p
         aCX9VzmZV2zoqrnvB8zG0A0YbonGgYU8xQVdYxMWCxMXptv3Hl6m0FGOLKiUSb0pqQ9V
         9/VVQeBTRhHJFCkQmc/M7cAoswqRLWRnmQMTMUvvZW7pKzmqXhavMza/VIlFu5eb4Dpm
         dobllNqUzPk1ixuRtmUGIK7FyBvrmxKKGOlfxBT5cDoToY0tE3OCi+3bu6LgZlBg8kSn
         FMlg==
X-Forwarded-Encrypted: i=1; AKwUvBwf4YJM98WwkEQw/U6CNRrxKhPtYkfZ5VU/bTh9eYenrIkMs6Y1xSMKwt6rI1cvDS93y+yvNUbIXFRCZwx01A==@lists.infradead.org
X-Gm-Message-State: AFuF++m88zj9ykquh+yt0nC+hv3DzmRw/+g5jHZa1KPMROXPlazZHRob
	+cofkJkc+fugD++eDde28E7cRU4ytyWfKoJeuCDl6SRYugw4jbXYOM9M
X-Gm-Gg: AYBFou2IG2SQp4xI1+4k8wpTzQhmB9GyzTDsC27JKsC29cmXfG6XaNlJwNpTvHjZJqa
	79nhlcOEc2IkUnuWPLKM4Hneua4QdTfLpQcQlSzVZUp4avh6WUIe5BEbhRCxXKVr0xiOfbql2zK
	MRXa3KVpZgdZ9PWDJk9nx1bsBn5cLE0lKnrScQeLXx57bhtkOPuqa6Y5/F9zrR3YBUeWT3O4VqH
	dhQwHa5/WoJ/an7tRwlBlgH+6kcdniYQd84koF6Ra+ne0/9Hz6qkyLGbEujKz+6nZnXCmF1md5j
	ti3LvNHW6Iml3L6WljA92+GYtNNwyA901ealicPHtfK3AreqhqwFAE/NWE9RE2Ag6aaIjn0X+7R
	rCCvId1X7mREopugpSSUksbLqIOofB1As6B57EME5jSTdUWQ/ZNOkrOCcdD+oQOMui3qU/O2hmS
	T9uk9vqwI6TBNyloU9dBaB68wl9N8TJfAQjLBC3Q/eHk4nNIBsvJ6bsNrMJt/4XJi+3A==
X-Received: by 2002:a05:6808:bc2:b0:4cb:f21b:6f98 with SMTP id 5614622812f47-4ccf9b8f79bmr1640523b6e.43.1789698015057;
        Thu, 17 Sep 2026 19:20:15 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm295476a34.22.2026.09.17.19.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:20:14 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 21:19:52 -0500
Subject: [PATCH v2 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-3-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698008; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=5AvlTzf3l8b4LLef4GkI1AU4KWt0gDt38qriJ2bzdYxbLUme++T/DOctXG9bxd6ylcEF2KKoj
 2xObESmwo23CDAaFIvEw6+yWIBFc38l1dxVsxUSc08ka11Xc1GqGfja
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_192016_997871_E51CAF73 
X-CRM114-Status: GOOD (  12.23  )
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

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0


