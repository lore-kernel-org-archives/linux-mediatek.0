Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B37606D802
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0TnjnpyV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RUDqoKYN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EO7R+T49bwB8v+cw1KxuhoaSRsFWSxfXrC6vOceJYnY=; b=0TnjnpyVqIfvKoJKv7X3x180hK
	/as6Hhh6zswJMAiufSU6klLVcPcLGUrpLKE+C3Z9Hej9rmDeTk2TkJ3YAuTu3kGjVQn8Rk2XePd92
	5Y4K+zJ4nFf6CL5dekgogcltsl2HWSsJhhu1EkepW4cUkrIMifk/e7Oadj6lSpH+964qama8TE5aP
	XZOChhCHr8RFCNFKeJ7KkegjV4cH4aNmVfi5cj3Y8npCKAcgj+qb2MaJbSt0ercSWWly8/LJipTkd
	Mg0OS9NuERhyl+N4DY0/hK8JlqhRnerIFwNRy8JIPW2JRSb9vSU1GVknC3btoQ4TCZekz5RGh28ne
	f7AiXlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfR1-0000000EevM-1ZST;
	Sat, 07 Nov 2026 12:22:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfQr-0000000EemC-2Xet;
	Sat, 07 Nov 2026 12:22:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AEA5960F40;
	Sat,  7 Nov 2026 12:22:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794054124;
	b=IvoXO9lEW5xp7iWn3EQS8+QJnGIe4U4GrQGYvwE8UsFL43MVHETi7Bd20wZW99DP5LvJ
	 D2UWb8RaYTH6VT/Y+QlXA/BDetC4+FNY5q83WYx7mgr5YAmnrwbjli4ZyL7czdiYRwcm8
	 sK/vCe3Kc2qgvUwfsyYJkthaHGPqmKErbMMtOZmUVNuj5eCMeqLnsQhvYBCcAPIZ5+eUY
	 3dk6hEHs8idScprsdjmtr66I4Oa/p1V3DXwsRj0SpvDOyjznR9VPcFvEhsmDukye0dP2E
	 mdhuTwSz1YgxePF1Vw/ErYDxzfMm2I9awVgKFBsUUQPMqxB/RCXqSdSEikBeZr52wgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794054124;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EO7R+T49bwB8v+cw1KxuhoaSRsFWSxfXrC6vOceJYnY=;
	b=knISGpdkAIfYkGMYO8fcOhVcQ+NQ/q33gvDBI7D4H05v1EF1RStBDl8/RDISuoDMdy9P
	 uVhyuVyNBNhfDgf5Mtpk2coBB4u7AIPJlvu+VxTWrMoWvkTuPYB2MUZ5wr1NVgNu3mUNy
	 aycc2KJJQSEbOM+nIEzBMwFmW+s0/XoxUugy4NEY1NPTWL3yEk5KKBo5E3I8wP+VP4xip
	 qUsXYkEzMqyfJPZPZcvzt+pOH8aENbtg/jstmrxeMOTiBOD6rQ9W3jkS1JzmOG79rjm6E
	 Kn5gixcSIIKGW5nHG7mJs9DFC8g0EU0ZF701mqJdTVn2RQByfx6sw8XgYK4IjR6agbg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5ABB51F008A2;
	Sat,  7 Nov 2026 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794054124;
	bh=EO7R+T49bwB8v+cw1KxuhoaSRsFWSxfXrC6vOceJYnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RUDqoKYNqBTpBDwdF8ah4CIPVv0GjexfMdS1VPExW6hhnhRhB99qgxn2k1v7bti12
	 3PaOFzrhAkfUr70VTPSFwTyvD8o9FK0iqBcFhOPle0c98Zqww7NaxDAM4xKsfHwg4W
	 GiQD/zZQggEcoA1eCOSyjZL937cdDlA/rGGzSwsuGhR8wuta5nK808dWN6Y2BrxGnV
	 r8TE7HmgTGQcrzpqqA5XitVjPQIOAhyHcIS7X+cyV4D8BMqXDOlEHSArinPy8uwJIr
	 Xr+eHgYp4GLfOhxUE2Oyao38McGwBuzou5iT7F3elavD5n+2cb8ZC54cc/AW6UJaxX
	 aqEzSJ+gzcdRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D966747BE0;
	Sat,  7 Nov 2026 12:22:02 +0000 (UTC)
From: Rui Cao via B4 Relay <devnull+i.udp0.com@kernel.org>
Date: Sat, 07 Nov 2026 20:21:59 +0800
Subject: [PATCH 2/4] dt-bindings: watchdog: mediatek,mtk-wdt: Add MT6833
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-mt6833-base-v1-2-bda21083e9f3@udp0.com>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com>
In-Reply-To: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org, 
 Rui Cao <i@udp0.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794054121; l=892;
 i=i@udp0.com; s=20261107; h=from:subject:message-id;
 bh=BmzvMDSSGsZ+iD74UsWjZpukUgHxSh4ohrYyIUhF5jE=;
 b=F57GxYhOMBYbveCONM116XPFb4pK0L12+SfnY49y8GXm9fBg4NWCDOdE9k9AtF/ZThFPv++p0
 yd0LKdZEn5wCoZw8LDCNADha3POq9r+6aEPlO5YwWRiGrxn6mZG+eXC
X-Developer-Key: i=i@udp0.com; a=ed25519;
 pk=XZJKcKgnUUjjyw8KuKy7u2QeIX0JLY/L1Fxzwwje41w=
X-Endpoint-Received: by B4 Relay for i@udp0.com/20261107 with auth_id=1443
X-Original-From: Rui Cao <i@udp0.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: i@udp0.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rui Cao <i@udp0.com>

Add MediaTek's MT6833 (Dimensity 700). Its watchdog works as MT6589's,
which it falls back to.

Signed-off-by: Rui Cao <i@udp0.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index f9b725592c2..dfdc06c758d 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt6572-wdt
               - mediatek,mt6582-wdt
               - mediatek,mt6797-wdt
+              - mediatek,mt6833-wdt
               - mediatek,mt7622-wdt
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt

-- 
Git-157)



