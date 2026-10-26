Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C71460A2629
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKmsXQ1I;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AiCMRiXh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=; b=zKmsXQ1IC/5GsK
	th0X7AOphiYzhBF4ERvs50YtpU8aWsWZxLzXdqtJlAhqljZDmuJ/c0ebsuScwK7grdMDGcW9Wu8F4
	JDcgCeAGIfRCtk1vWtHlMJkQXi88Vz41xs/L1UIrt29jFF4LdPV7FJKqblnllAzNEcnUVbtQKBYbm
	YDE5jtVlilnLV+EN9uDik+R4fwOoBDnFjlB8/rPY+vyPdKVUawgkVAmvDJV4vnEE3FAxtyKAJKdp0
	0xv/J+kk43ifVA2bGsaDvxVzyKzBeMIz5yTyZzA0p26qNWlub6jCo7YCtTR6CqJWYlwxKHMoplNPF
	fwr6GrXcCEgYDYVEdO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSj-000000029dV-43Da;
	Mon, 26 Oct 2026 09:57:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSd-000000029R3-0lbL
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so7850765e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008665; x=1793613465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=;
        b=AiCMRiXhL7GIHj7IyJANX4uRjX17krhGDFuHqXwwFyd4kn/8ppWJadjMa/qFdAWfzl
         DROasGnkBnQ5QvbxgCRehTt+DlTG82LocZxveq2+M2cH85e74AbE1COTwnjoEGHEFFXN
         e4x3IF4iFgmuEJGWB58tMozrLjPcm64P1J16ONccY6FAfLmiC0my6GLw0KJSUOVHpvBm
         Oq+JBxrPhd1/BtpMoWgGe1Y1N1kOqJitV0RPwFKZM3k0EJzJnLclhicRCQ8Am0QJwF4u
         vwFQW8gBUHC9f1w3rLuwnawC7G9dwxEDJXylrq9gp0d1DNLP0MziE+Wmm5SQ3yzq5XM+
         jTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008665; x=1793613465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=;
        b=aJ8IHIiRbC4YgM8ZD5Aso8CVeONNoE0zBGBelQj01wpPqzr9aDssbY0pWl6trgv0md
         woH5llAnJ91cLAfl6eWV9vbnxGRAleJnlegxrYe9gz4r0ciz2gksdhAmRWKDHQINmD1Z
         u0cEfaUYUNczFgTCP/3z+gi7iwoD/DuWvYKu/uTgNhruOO/7sjPbQByZp+1Lutmc0Aqg
         1KREvuA0sMgbwoN2YVWtYWKocRTODJnzmgq9ep+ELT0nayAbW9Ns8f8W7UlKoDijeblq
         K4SDknuoOQHmlmgmmTS3wjjdtPWCE0O/b+cX9PFkbgVQ0X+ZCZBxp28S1ComGuEl+cES
         2SgA==
X-Forwarded-Encrypted: i=1; AKwUvBykUwPAMRPe/5X1JV1t/AQ2FHHPjUffGmGg5pUgdjNexWVilp7q2UD0g2tUjaofucotQh6zutIeExOjLx241Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYKSSmAW4DdcOqazOibmr87eVdDCrtIM3kSC5VRJU3YODUge0CCz
	1YGs7QJDNMK2FMHtiId13AoX0/K7XtKzhlR4Et1I93VA3UH1yvfEhF3u
X-Gm-Gg: AYBFou1nzPkaRg0JfzHkPdDQxuC1HkWJIDIvrLSxLbQKyP2hgxsE7Wg7O14VxyJXqsp
	Nmcu3Zf0AgQzlMqh0UjwaJoTx1G42lhFvvlilgdGdTiWGBYvVxj9Y7SWszImCRyY7CFYZbgPSSA
	moYlQ8BWCC9xZIPaTSNCNF0aPnbYJlZCHgUyYuD+znrjW4qZipo+NEiUWzimZigYRSyInUr4bdA
	8zv7BriVgUDBcteCV//r1kd7sMMy7Mg/gJgRE0vAxAFH7vxOdm1p3sX6+VKKFzcX5LdimeZYQBY
	gqGxSKFGxMzDYnswGerFSlNLqiVOZELBxFfOGCGvhWxXrSSL8zJosFJzM9xZIW5+WOC4USS/msM
	re2uWUpVsBG+HYM82fzc4ph4DBPeLHn+8lxcahdjrL4FiNAfWAXCCQcket+IMarD34ApfKE3Sm+
	Za4ln1T3NtcvJc4mmwF1VP+EQbvkO55Zw/CNwfbcY+ifds3agbEBhf7vboeS81AvXJu9E5wvY6J
	UMxhd0W8l22mD9Xb97nUppboJLFntXHRU4cSZukk5msTryvCaS1/qMUECOt/ZWIpOxSqFtpkzae
	tgUDHs2Gc2wvIhiqn6zCJgDOuHVGWRM8GsItqEgihx8Z+7Z3RGGLRFwgblLk
X-Received: by 2002:a05:600c:8114:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4a35aca4ab5mr96619105e9.22.1793008665078;
        Mon, 26 Oct 2026 02:57:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: airoha: en7581: add crypto node
Date: Mon, 26 Oct 2026 10:57:14 +0100
Message-ID: <20261026095727.31708-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025747_264576_8B624964 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add crypto node to support the integrated Inside Secure SafeXcel EIP93.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ee1633f01068..f214fa3a3e2b 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -470,6 +470,13 @@ fixed-link {
 			};
 		};
 
+		crypto@1fb70000 {
+			compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
+			reg = <0x0 0x1fb70000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		serial@1fbe1000 {
 			compatible = "airoha,an7581-hsuart";
 			reg = <0x0 0x1fbe1000 0x0 0x40>;
-- 
2.55.0


