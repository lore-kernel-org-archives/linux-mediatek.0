Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F2160A263D
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n3CqbQRw;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dL9+QwmV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=M7JJASl+nuTr5h0hwNfOIsigjQbehWTAWvZV7+ghWJc=; b=n3CqbQRwsn6Qk7PrmilFsuFNuI
	1y/3yz2UIATnVRHWzE5OcErWqsb9iDNLhlmvu6ZMUdl9xJhvFT47qxUTzJRi6aCr5tRGINNmufHe9
	CHLn+hW3QEHllINwxNGjI/HMwkER9UnZ2rJw6QGOQEYHnkn34e1ZvGC056GEkZqm6nPHTiMZATP+g
	7g9qzT4xkv0iWFUz177QdCaoAw61rjy1XwcjSHlL0NexTt4I0n+w9ylvwr7FKbsoREuF84/TenmRK
	SSqxNe09nZKDEY0ExfNWcQDwCgLcnb7wtiR3S/eMGjQc6Tszu34ajH5IcmdSD3deerzyZ8ZSOWbtY
	cpVhtKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwL-0000000BPSo-1XfT;
	Fri, 30 Oct 2026 10:34:29 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwI-0000000BPRU-2m6f
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 10:34:28 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3535a54bed9so903395eec.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 03:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793356465; x=1793961265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7JJASl+nuTr5h0hwNfOIsigjQbehWTAWvZV7+ghWJc=;
        b=dL9+QwmVqLpIAqzmSHwe7Z12xWuZCquqlqNYDAj4Me5LHYEuHLy4KY67oafAfY0yxO
         ylqMgxtimmMthwSzBX0l+62lK5QNIYXptLDvyr9zu1dLXyzMFwSzMDMLv0ygYkre7d+q
         5sjqxPg9Q14jrvZKs9uJYigpaaeiQnt7I8f+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356465; x=1793961265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7JJASl+nuTr5h0hwNfOIsigjQbehWTAWvZV7+ghWJc=;
        b=E3MNGQpqGC2ZLXIxyJ0ar+DHMzCf6HpE37LyHgXJNA2y9LtnsOJPVcpnPIxYlIsZnr
         sWXo8bRPjz22/FIskNDuzxD6S5hoGVJXXobAGSBdcYjnKWoSLcfW6f9ZRPYzs0SjNmUy
         XeCLe0HLwofeflguT9eqRXbLPlHusX5tXEOKrSckzmPLAS58UqC+CiOvvVczAY5HuMkG
         YtKom52aBnYr+jm8bYGkDJCR6Iv/jiXGIBNL2uNNMlCYwfyb9P7ohjopM13zbhiu1h7R
         W21aQbGpNTIEffnjGxO7rB/JAzIFSQNiUi634m9OfcHew/e1tx1PDtdLRrgDY6pioub2
         T7cg==
X-Forwarded-Encrypted: i=1; AKwUvBy/+7fiZTzM93z8M69ABct+3b5/sxDfL8JvKBe0MERd2LpXRguvSv+IBesS6IurAOa2JSV0v58GNTtAA+OcKg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKBO0wuEPdrz9qC5o07JlbE9TqW8BiO33lhYfRjTBZB1TgnZaXa
	oa/zoCoweozMbRi63fdL6q+mMOKxHcS7NsHDagmJLfaY69iARXP6yUhEJedNj8NJEA==
X-Gm-Gg: AYBFou08nKqbpg0/8NkNvsgqnGXoyz3x7H9CtyAcJS/sOe5hMW0TFW3dSqaQMmuO5O0
	81Y9nJv+QpnTxJXZzdlXjdmve23NOmGFVs+EZMAdBIgvKRStLcWYRGSBk+d0I54gk/D/xW4e55d
	FrY3J3MuO2Li8qvWiL2ENNDxYYbZ6HG7QzyowoHjams2CYElOQBUOFVxGgZKmPdBlLyVKRwXmuB
	mD0TS8NWoEoORjBBl5VdcBIgi9PNr9xPG67NXohZoUGvxOO454ieaM/6TK6ARhs+gAtiHHqJm6M
	OUyhhpM1UPla0a+S8hD/fmSoraanBotBVI79B+WzLSy4JUDX6gel7ltwHTwYIJnvq557MJV2O5A
	Yg2n3NnUhKI7kQASWQkwvWSqQmMeSIscbrr34updGtJ4eHngLMfUIiTCLmLF9ODNR5mQOY70vP+
	DSFXuk0tH1QeaTwxdwXV8HbL8fV6RZfEDHo/M5ksOsPQF9YyQRQ/rvmMcLNhCU2b1ySwkUPh5E3
	GgY6qx0PauYd1FjRxxFMSAOv9Gssx8ncDAXq8KplGH7PFr9i43SAAGZxPvnfUSbXgFnRLMZvgGP
	82z28cI7J3I6AwCnya5Xlek5cvzFMW9v2rpNPvPrgLhYYwT9iEi2dL/qihyn8omCGkdOTPxHGTD
	Hh7xFqpnUhzai
X-Received: by 2002:a05:7300:cd90:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a42454b8emr4378368eec.22.1793356465021;
        Fri, 30 Oct 2026 03:34:25 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:6ef0:e162:ed32:a99f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm7471774eec.22.2026.10.30.03.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:34:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators
Date: Fri, 30 Oct 2026 18:34:15 +0800
Message-ID: <20261030103418.2355854-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_033426_752356_A1B7EE8A 
X-CRM114-Status: UNSURE (   9.28  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Asurada, the MT6315 buck regulators (Vbcpu, Vlcpu, and Vgpu) are
missing the regulator-ramp-delay property. Without the slew rate
specified, voltage increases may not have settled before switching CPU
or GPU to higher operating points, risking undervoltage crashes.

Add regulator-ramp-delay properties matching the slew rates configured
by firmware, with values provided by MediaTek: 8000 uV/us for Vbcpu, and
4500 uV/us for Vlcpu and Vgpu.

Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI regulators")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Patch created with LLM. Values were translated from raw register values
by MediaTek.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d1993b80f9ce..43286241cd22 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1812,6 +1812,7 @@ mt6315_6_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <8000>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
@@ -1821,6 +1822,7 @@ mt6315_6_vbuck3: vbuck3 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
@@ -1841,6 +1843,7 @@ mt6315_7_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <800000>;
 				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
 				regulator-coupled-max-spread = <10000>;
-- 
2.56.0.317.g454f8302e1-goog


