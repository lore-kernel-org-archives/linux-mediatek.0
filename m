Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB85C48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z7Q1BpdFE96j/+901jCtibE5f/f88ZZPNniLXRQM0DA=; b=kFk2TXV+2Uk5Wf8H9/RwLdG6gR
	jw7LV0zr7apd2LLyRV3WoIVxeObfH54WNxWFHWBZIe5TzzFZrlJVy+NZ8YKD3OAWVu1FjRHvHAK4Z
	VTlc8kKueT3RYC3PC0v6x/ctg+9dYDCS166lKNJcrUv0jcvF94vjS5Mcya4wCSgdL+TwST6vYfN+T
	yR7ZJdd6J+VWuCX5J4UoY97ngq0XZNi30Hg6MeiPjMC7Hhdfevq+vmNBS3MFSwXshElc5WImOxmJm
	eqJVCwDt0flkljSDqKZREySDNXqHrYh3DB5kVtViL031x6HZDn/8OXgFbhQQLfv01L40LYEc4QKlj
	9P2O6IEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raFsp-0000000D79Z-0a1H;
	Wed, 14 Feb 2024 14:05:07 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raFsl-0000000D78u-23IX;
	Wed, 14 Feb 2024 14:05:04 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-561f4bc306fso2223257a12.1;
        Wed, 14 Feb 2024 06:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707919501; x=1708524301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7Q1BpdFE96j/+901jCtibE5f/f88ZZPNniLXRQM0DA=;
        b=HyClbut98SBEcXYscIg4uonATyKLQnSkqjnYuUnhJjs8IetXsy0zl6gLVWQgB78hnN
         JmrETvIsHOH9A/wXtQAqepZsaNZ4RvTS+p5GPRSSSQTQRrisdZfdzGi0nQ5wWgtT0JOC
         g5we+WGY3SgomdCzuQaogTqMaIndTgw+XZ8RJxwmAMChd2sCYMmN4Clc3hODMQAZzKfg
         cegyQoXLYkjjODRpVRPBRSIqEUsqbi8nzc+WoznnbXSYFwEABr3C1NqZg5eUw8DeJf8t
         aGUWCTj2QvSL7N00ILhkBye5gZhYPndyT+wdxfTMK6wgHfNspsD1/lbdc50+He2rGzZ7
         zbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919501; x=1708524301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7Q1BpdFE96j/+901jCtibE5f/f88ZZPNniLXRQM0DA=;
        b=Ci/CNGNWxgCZxgPt/66SKsVp1zxq586YOmEeOnk7m6Dh+0I9zRfrYW8D5E2jqo8rmt
         oKBg7oAX35GUhd4JswWjLV77YVY57g/27o47a4RSSQLv7SZxq+RT0IvOSD+DiQCzKLoT
         51VHuYVlKKlbSgv0BTdH1btu5AnrivxnhDSlF5gHG7R0MWrcZ3n/dLmBwZnffsAEYtSN
         RfGjwzWI2M9yFz5Jq19uh/9xlzSC2iqZI3tq0vqsyFlOjzBLInmBdxseGuQzKi7cOLs/
         5ik7YCGnd0sSYY0Hpst7kQiV0k9tVKtzE0ekFaBCOdg/H5gWXldP4r8RpWEx+BgGmHrD
         HE/g==
X-Forwarded-Encrypted: i=1; AJvYcCVW2Qprq7ZqGkM2ZveMiFE3FGUIB7VVyJHcMiVohmr7c7g4YB9qARHJFleKHx17HhDkc/82MjXVend2gbUVnTqlCcXsYa2gWTM0L3w6ED1qqQLET125iIvj8dQAVkHu/IhPkAhhwKLmLaliqHFo0g+ZGpQj/11tMNY=
X-Gm-Message-State: AOJu0YzDBPhnSxjPo/Idekmh0xNo7xWVixFFxfDi6YfHt1Pfky/1WM6w
	Wp15bH0vY/6YIlpjhWnEbe9lFdyUlZF1FjKqPbmXrlJNXpJauCJX
X-Google-Smtp-Source: AGHT+IHV5lTBSsU2P4rgMTuePMzPF3w3ljb7dMNL+67Z2B7qY19FGGj9oQip/nDTMA6wH9kRqjNzqg==
X-Received: by 2002:aa7:c61a:0:b0:560:799:f802 with SMTP id h26-20020aa7c61a000000b005600799f802mr1932526edq.21.1707919501304;
        Wed, 14 Feb 2024 06:05:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtmzNXaugjkX2Lbay0q+RsXHbXxui68JmgAB7AAmk4fN6jM65+wulw9ikFfckzf4uYl4dacm8xHp/v2UQatJoXIMh9DdY4tfvpVmwaS8QRN26anrUvaF40ZtJauATQNUIsMTq7FYNnfRokS3gSUXM2eLI33PzYCSVvpQiDHEuJk81vMeQX2XhGl6jYHsBVrk22H67C4u8N+drhgxpW2To1xIPETJ8yOjudZKLtwmBEIvy/VaytbZGFC5FcZQBMSl1/azpXi+FC16ov9Iv4Tz+CikGEFzMUZxfRTlukzTpTaSDTWrlC5aEYVUl0EaWshVPu+v9XjqKmshRUdwH7HGTkIprdv/AYXAXMiFYqDqplLuVKPHl/OmnMHinF+8gTyWy/2P6Gd8pfN09kXEM6KlzG4q+VuzFZHKCYPtrc72Z67u21U0VQJzM5lPAOlld1uLGGuJoHHWrhGCkvLqV1zYzp77iazMGiQSMqtOk1/a2fQuY13LupsaYThSx/+PlTPg==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id p23-20020a056402501700b005614409022esm4700646eda.63.2024.02.14.06.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 06:05:00 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible for MT7988
Date: Wed, 14 Feb 2024 15:04:53 +0100
Message-Id: <20240214140454.6438-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_060503_556638_C9B87704 
X-CRM114-Status: UNSURE (   9.84  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7988 has on-SoC controller that can control up to 8 PWM interfaces. It
differs from blocks on other SoCs (amount of PWMs & registers) so it
needs its own compatible string.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Explain new compatibility string reason in commit body

 Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
index 0fbe8a6469eb..a5c308801619 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt7629-pwm
           - mediatek,mt7981-pwm
           - mediatek,mt7986-pwm
+          - mediatek,mt7988-pwm
           - mediatek,mt8183-pwm
           - mediatek,mt8365-pwm
           - mediatek,mt8516-pwm
-- 
2.35.3


