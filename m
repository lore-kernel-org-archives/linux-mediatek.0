Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C397BCD611D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XDBK5Er15QvjGUwykMjw01laGvht+dhKObLHHzorKRg=; b=4kJKqmTfM74WMSOeipJko+naPo
	XTLRUNtqwL9fqhyxqCyvWih6VjCXGKBzKpSB58ib6J6eScgDKi1/BeNbIjSBo3dfYfOJkM81RkFEH
	If0jQzxmPlCCbCLdlA+qjmKpiU2K0Aq8Vb6/d3g/3FQAVLr65+tptYH/oJBawgl7YkdMq98sBG8vm
	zyLHU2bDNibc5oaN44tkbxCXKeO/6bBmch0g4jfPnS0TsYQaykflXqjLtLTOB3Pfk4wKgEYIcAbAk
	QiplxwXQpIQUcow/7DXqWFznTuRV2CK+UriO/WVY/znlVwdqVv/2CGOCWQ6zb353Eu1QFDFH84dIX
	Ne4KtKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpv0P-00BO9S-0f;
	Mon, 09 Oct 2023 18:29:25 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpv0L-00BO8V-2m
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Oct 2023 18:29:23 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d9a4fb3e096so109181276.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Oct 2023 11:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876160; x=1697480960; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XDBK5Er15QvjGUwykMjw01laGvht+dhKObLHHzorKRg=;
        b=bB3R+YUIColrXkxcsjfNYw5smLLCphDxbwzf+VJETW4tdJBrHsUpnbXcN29tw8uSBD
         4/yOoLTuFB0gUL8k5835HSa6gdGvm1nBNlc4J6GSh3XzgD7j33JTCwqB5iIYLh/aNVOF
         yxAKLQYMQS83oBLxcOGCsdKrH0/9VaHe/TDZrqDzJx2Emoxa9OhkVw0Ds9qAnnpxwHH9
         Kg8+Yvp7JkrlAF1tnldImWI5Zn/CDNfOPyuyE4Rgu2UuavlezAfIWv+iSbVe0ztEIUBq
         ph6f4HMQGVjp1VGeHSWazkX4k1H7tCWcImfHVuvbzSsioeJZKvkQc3mRgKoslPqIW6OF
         zoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876160; x=1697480960;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDBK5Er15QvjGUwykMjw01laGvht+dhKObLHHzorKRg=;
        b=a2RqlrvtS+eohHr7C2lZhN4I9YnSS54NVEg34zo4L+bQTPsufiUqlgrRvhTbXKB1yz
         utC2ki40Pv4dCec40BeW1EZukB3TqQprRwCmMD10D7Qy6cPNLDGKabyQCIb3vTo/NBBb
         S4klNBjL7lHTzWenVzI1CSxGJYYq5guc+xK/WWFJUhmISXhHurJeoENM8acKsPJqJOd8
         dknYiBpFP4Qxg/VeQp4HU3U/yQjq/tX17+6zTeXsafS6wcSgo4vjBje8zecdBtX+xxR2
         7gQHzFHF2bYZtzTcpGV4FkHJTTPMIoZeUQLLtkIfrt8+GXerudWt/Lmn4M+u3XJrkEFs
         rNFQ==
X-Gm-Message-State: AOJu0YyBZxkBWOtMDF0kECS51pExXuiRk0wvjy9v4yZXau1TwQDXVcgZ
	rgGM0DPVyQV8Wf/a2fMaB66GhDftXZ9Mvx71QQ==
X-Google-Smtp-Source: AGHT+IFEYT/za4QVR6fR/MF5JyjgO5M3AWWvhyO5pPz0UrgbgMOrmr3zJveczQ1Hka+kDj8XsImbs1hJdUTnEIDEMA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:ad50:0:b0:d78:2c3:e633 with SMTP
 id l16-20020a25ad50000000b00d7802c3e633mr230976ybe.2.1696876159847; Mon, 09
 Oct 2023 11:29:19 -0700 (PDT)
Date: Mon, 09 Oct 2023 18:29:19 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH5GJGUC/x3NPQ6DMAxA4asgz7VkCNCfq6AOUexSD02RHSEQ4
 u6NOn7Lewe4mIrDoznAZFXXb65oLw2kd8yzoHI1dNSFluiOXiynZUc2XcUcsxRkj/gp1yEQJuw pRQ63MA49Q80sJi/d/ovpeZ4/gDTkfnIAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696876158; l=1437;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=njDv3GAGmhVrExshk0hx5o9AbY/WD0+6gqoo2bn4Yhg=; b=1J2L7iU0ES7zC7vWFtN9NFGtdF0F81pv/JVQhRo8NZAZIpsJ+gGWhuCDrgOKhESE8tZUUsU3U
 d4Z2vnQKmFuD4VoXPdHgoaiP7YfJE2TD1dTaO5uvm7QNv0tFHL7+jAu
X-Mailer: b4 0.12.3
Message-ID: <20231009-strncpy-drivers-net-dsa-mt7530-c-v1-1-ec6677a6436a@google.com>
Subject: [PATCH] net: dsa: mt7530: replace deprecated strncpy with ethtool_sprintf
From: Justin Stitt <justinstitt@google.com>
To: "=?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?=" <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_112921_895558_FCA0DC3B 
X-CRM114-Status: UNSURE (   9.31  )
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

`strncpy` is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

ethtool_sprintf() is designed specifically for get_strings() usage.
Let's replace strncpy in favor of this more robust and easier to
understand interface.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.
---
 drivers/net/dsa/mt7530.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 035a34b50f31..e00126af8318 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -836,8 +836,7 @@ mt7530_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 		return;
 
 	for (i = 0; i < ARRAY_SIZE(mt7530_mib); i++)
-		strncpy(data + i * ETH_GSTRING_LEN, mt7530_mib[i].name,
-			ETH_GSTRING_LEN);
+		ethtool_sprintf(&data, "%s", mt7530_mib[i].name);
 }
 
 static void

---
base-commit: cbf3a2cb156a2c911d8f38d8247814b4c07f49a2
change-id: 20231009-strncpy-drivers-net-dsa-mt7530-c-40cad383654d

Best regards,
--
Justin Stitt <justinstitt@google.com>


