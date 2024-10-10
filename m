Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6008D2444F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 21:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eJW7O5XKUbOuuqLLX5pzcTQ1E4Av2AR4QeFhDmOQC8k=; b=fRGc7tkpiiUc6X
	uLrJZh1pY9BmGJA04AEJQPykJDqegnaVUu+k5XQXbVYY++0D+fCsLFFRPtqOwIaiaNEUhq3xiarfg
	BC5vr0aiqdQSGFg4xEwPr5InCGKW1R+gwoV2zxqnmZhwD1d0EJ8y4qxucNHwl+M8iBQSS38U8W8fK
	O8JDKKaquB2jjynsmq3IOFl8L1+zsJXgoP9GCkwQvlQvaXq3w9b5X3mxJP7LMDCXf6LZ/wpvqFaxL
	jQe9nVeJQ6iSlpkLQSoDSBxxrp7ajL9UwN6hkKLyuhPaWwIdBPsyb/LMcjqu+yr46Sc7cnQa51EOP
	+dPvMN1iDr/5zPrQVfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0gv-0000000EPJy-2m7z;
	Thu, 10 Oct 2024 21:27:25 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fX-0000000EP2w-45qQ;
	Thu, 10 Oct 2024 21:26:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d39d9f782so829595f8f.1;
        Thu, 10 Oct 2024 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595558; x=1729200358; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJW7O5XKUbOuuqLLX5pzcTQ1E4Av2AR4QeFhDmOQC8k=;
        b=JdQikdAr1udsa0//hXVUuu9oZd0rz2G8GrQqgGWVwq0U37cYmVoNj2O7fwNOMqhoyh
         loaI9biU8xbShHXL0sxsYcLL/1+EDFSAQPrxp/zvaX5D+mUjlFuIJTtvM2Ps7x1DZNiC
         +bQAogV0iEdXsO7YFB1i1wmfA5MwLxYx2Jz3dGLYyoxTgiPf4XJJNzytKrs1UY7KNcyU
         smvqiljbWrnZC8O5A077xZdgNcubUQBH/F05wPKrh2jSY3DcyPr+5Y34E0H7nWl9g1ib
         vh2TVm5cGwBU6a4FgFQamCozNbgDNtT7M0QW2o9K0vPJAvF3jnxCDT8PkHrkvVreS85E
         3p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595558; x=1729200358;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJW7O5XKUbOuuqLLX5pzcTQ1E4Av2AR4QeFhDmOQC8k=;
        b=rGDvGs1/3elledhDgyPdW2hCWNSFnDxHwQeuKBayibSOZgG3grH1S3ZRo96zw6cjyX
         k6qk6U6DMUzLICmsXRqU6/31TtUrM/+ZYeFq2wGdsaKwjkMwUun/4xGk+GgQfRsFC3n2
         6c7X9UdHbKyeRR0wZvrT9r3U2tSlVCwt/iYlTG9CLewDZ+BGnKGpYFKMb5cNI+vPgbcz
         bOKrz3EMZIsO2APvvWiv/aLNcm5MjwSdZuPkioASZVcH2ruuXTCdlX7ZJiAuMsOObX99
         deAKDsVbDqkYOvsFf3RL9S4g9XrOCT8kd/7fNy6gGHEpvsoR6Th7Ss/JJN1K/q1VniAs
         SdDw==
X-Forwarded-Encrypted: i=1; AJvYcCVLZuMn4Mdvs24S7joOVDiihp6hls4KzbNjguMUhIdzkc5wIn/J6idHQXJg0XgO300yH8Chs3009HzSTMYHHwo=@lists.infradead.org, AJvYcCVj0uLQI1Yol1m4cnjOavKmEjk/yUbj1Q5KitPlhz8cBQWjCH+QqL/iQH3kbujPPNJnUHVOKuXVQubYbkFlw0Y2@lists.infradead.org, AJvYcCXSliB4b6Xqywg/lLJiZCkordFySRAIWWsFIy3myvx9qPkCY8KL2N1wLwpT6PNO6Xt0ide/29PW7exhsIdldvdJnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw02gzJJpxMoVNzcyc7WpXhydB3lQvRGWi0epUuiR1+wu4WQ/lH
	Mn0fuRiTKiLwq8ZIsheVeuuK9YML5RdyfUfXXYLIYT6DbWVhWVU0
X-Google-Smtp-Source: AGHT+IGjhjvs23XBaF9qo7yUB6Onp+okLGqfHWsTl1zeKUZJoKhghxIMshywkcca8h+/0cILKz7jtQ==
X-Received: by 2002:a5d:5641:0:b0:37d:4a2d:6948 with SMTP id ffacd0b85a97d-37d552375b6mr274533f8f.33.1728595557711;
        Thu, 10 Oct 2024 14:25:57 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:25:56 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 00/10] input: automate of_node_put() calls for device_node
Date: Thu, 10 Oct 2024 23:25:50 +0200
Message-Id: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5GCGcC/x3MQQqAIBBA0avErBNUamFXiRDTsWaRhloE0t2Tl
 u8vfoWMiTDD1FVIeFOmGBpE34HdTdiQkWsGyeUgOFeMwnkVba4SD1NQR69DdKhbZGI1qPxouXQ
 K2uBM6On55/Pyvh//OD7kbAAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=3941;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=H3QCDpR4l7Ykj3GCahYdrBiVlspqgJ1J9/SZlkURrtU=;
 b=ts+Lle7wL/NftURW4LFEavUzl5GrcOSKdRmgSDAOu1aMNej5jIzm2CTRgJNXE6hx7mfQRYjjT
 +ApNZbKfUf5BWFg+9nvAGVEh/pTZoGKhLCO94Qdp2GRbQN2Bm16D02B
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_142600_060562_AD20D657 
X-CRM114-Status: GOOD (  16.94  )
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

This series removes the explicit calls to 'of_node_put()' from the input
subsystem, either by switching from 'for_each_child_of_node()' to its
scoped variant 'for_each_child_of_node_scoped()', or by adding the
cleanup attribute to the device_node by means of the '__free()' macro.

This series simplifies the code in some cases, and it makes it in
general more robust, as it will avoid memory leaks if early returns are
added without the required call to 'of_node_put()', which is a rather
common issue.

The following drivers unconditionally release the device node after
using it:

  - misc/twl4030-vibra.c ('of_node_put()' under an if, but only if the
    node received a valid value).
  - misc/sparcspkr.c
  - serio/i8042-sparcio.h
  - touchscreen/raspberrypi-ts.c
  - touchscreen/ts4800-ts.c

The usage of the cleanup faciliy for these drivers offers no real gain
at the moment, but as soon as an error path is added to them, things can
go wrong, as it has happened multiple times with such nodes. I intended
to remove this error-prone pattern from the subsystem, so it is not
"borrowed" by new users. But if someone has strong feelings about the
automatic cleanup for those drives, I will not complain if they are left
as they are (at least until a new buggy error path is introduced ;)).

The approach for the variable declaration is the one that has been
followed in previous clean ups: as near as possible to its usage,
instead of at the top. I have no strong feelings about that either, but
I would prefer it that way for consistency and to have a common pattern
for future additions.

A single call to 'of_node_put()' has been left behind in rmi4/rmi_bus.c,
as it is used to release a node passed as a parameter, which would make
the use of the cleanup attribute too cumbersome for no real gain. It is
called unconditionally, and it will probably not be used as a common
pattern for new users of a device_node.

There has been some previous work from Dmitry to use the cleanup
facilities for 'fwnode_handle' and mutexes[1][2], which this series
aims to complement for 'device_node'.

Link: https://lore.kernel.org/linux-input/20240904044244.1042174-1-dmitry.torokhov@gmail.com/ [1]
Link: https://lore.kernel.org/linux-input/20240825051627.2848495-1-dmitry.torokhov@gmail.com/ [2]

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (10):
      Input: cap11xx - switch to for_each_child_of_node_scoped
      Input: mtk-pmic-keys - switch to for_each_child_of_node_scoped
      Input: sun4i-lradc-keys - switch to for_each_child_of_node_scoped
      Input: twl6040-vibra - use cleanup facility for device_node
      Input: twl4030-vibra - use cleanup facility for device_node
      Input: sparcspkr - use cleanup facility for device_node
      Input: 88pm860x - use cleanup facility for device_node
      Input: i8042 - use cleanup facility for device_node
      Input: raspberrypi-ts - use cleanup facility for device_node
      Input: ts4800-ts - use cleanup facility for device_node

 drivers/input/keyboard/cap11xx.c           | 12 ++++--------
 drivers/input/keyboard/mtk-pmic-keys.c     | 17 +++++------------
 drivers/input/keyboard/sun4i-lradc-keys.c  |  7 ++-----
 drivers/input/misc/sparcspkr.c             |  4 +---
 drivers/input/misc/twl4030-vibra.c         | 11 +++--------
 drivers/input/misc/twl6040-vibra.c         |  8 ++------
 drivers/input/serio/i8042-sparcio.h        |  6 +-----
 drivers/input/touchscreen/88pm860x-ts.c    | 20 +++++++-------------
 drivers/input/touchscreen/raspberrypi-ts.c |  4 +---
 drivers/input/touchscreen/ts4800-ts.c      |  5 ++---
 10 files changed, 28 insertions(+), 66 deletions(-)
---
base-commit: 515ef92b4939fa51f9f1ee278618e2d419b0b8b0
change-id: 20241009-input_automate_of_node_put-1bae9f5c02d9

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


