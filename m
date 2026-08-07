Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAEAC5AC67
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 00:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jg9t6USd7aCBm3DCerjF5PDOcPoho7Pj+WkMHzrBY40=; b=ORE+aGJTzmzT1z8uU17mdpSpxj
	W3mZwCBkVm3CBUthWZYAQ1A2MoCPwLijG3BVF/GijuC3p4YJcIBjx0CsDBhG6eYhofn6CpCc46rgk
	/XfkrH2KC5BPTsl0cuHeuZtW9Zb1OSA70HTF9V1q/2szq3QQ+E/0vJJRhyWMKC3xqb9sxg1JrN+5U
	nwhauEZaiP34CsaE1397V4yxj5fqo0dckJXJi/N0Qm4LBKe9weCzzQe5Kk4rCS4Lb0QVGnVsXZgvp
	qv6kNwgGe1cGVxZKfoYtUwyQG+tQSp4PKz8pAR1jxzUW4ATU+Maz8G5iZwIHH9Edtr00MwOxZEG5O
	/7zOZxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws8eh-00000006uMk-0qr1;
	Fri, 07 Aug 2026 00:41:47 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws8ee-00000006uLl-2MG5
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 00:41:45 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aec6360133so2419823e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 17:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786063302; x=1786668102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg9t6USd7aCBm3DCerjF5PDOcPoho7Pj+WkMHzrBY40=;
        b=R/rpTsUTb5LWvKCGtb+nWyEdrX8HOjC6HjH5hZSZ98U+taBiL6Ty4R3RYQwi6k4E/Q
         Y3G3w6lgPBDbQBxS8ZLLN3FWpfj+gN2XljDWwumjBCM3T8DS4qZlmKmroT7z7nXOsM11
         wqixXIyIFgVlSh9q+LeX1BpjwCZPWr3h/q5M5pEUO7u9RrhpeLETV+sV9c40BfiDrDix
         bEgiAoOR1yQdJmJOMrvF4esrlbZY4VVsRm0Zh3dZvVzOTRUzdwCfzMqEPHk+mof9H6eL
         EQSnyBl41PBQ/NgENIF4A6r5Why+bVdJkbkCgfY7PuihoWfA6U7Uf4eNiQkgu2P7uU3y
         xudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786063302; x=1786668102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg9t6USd7aCBm3DCerjF5PDOcPoho7Pj+WkMHzrBY40=;
        b=WsWg6G5gR5oobUW6gWcUXGQpdCCf6pF33n8aeniizggwtKuZWjBFP31q0sk5NzOKCG
         7p/1yQ1dh3zqTW4JYzQNMlBfc5TXt4zuMMpvAiqaXlNyCUyfhkQIWFuX8vvI2jwX0eFB
         oqccq23QE0Cv+7zQG0pFObG4CjL6gcgju+ZwNU6ZOuiQt1zjLhslu7mF2G/twUkaWKQy
         dl8fV1LgkA4oy43VsXH7GMaRxOqN4JscKJ9+RDRADwVr0W9a4NJJGbPH0fYW4VT1MLtD
         NeWyEADTRKuXZmGbkY6ZWgj/dmdJWBlBuG/WoOyywKIhrynrF8xDtJpqXN0v0I4XOAYA
         S/ZA==
X-Forwarded-Encrypted: i=1; AHgh+RqLNLHBD5jaNj7SKFLZI/+bvudeXCkGXzj2QluFcpmdUmSpQIzTsuyVHWKbj7Qb5HAFMWStlaREm1PI8Ggy/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiXFuwsL4CncAfOjW0CbehPl4yNzQXf84vHFxeiivQ1oKNDYmv
	IKHIqeCHsbRF+Onok9N/xxStNsB5o9SqFkP9RrLFaAXi4PLGTu6AmZA=
X-Gm-Gg: AR+sD1344qqmkfzGFGzyWiXBMXWVymDmVGfWyw1qy5w+LdR1N1+qiaCU4rJ4k9Hb4Fk
	e+z0fuZVGg87d9PcJrB79rAusvTjXwB1wmsxLr/vBCdPaC/564l62UmmQk9oRqiyEuT2ocQgeLM
	2L9+A8cOF0+ZsGjugAgtlFRk03nNzpS47bPYGEhFaDJhMW2k8Z4ar6v70bPA2UTs/wtfmlTXqar
	9kzSXbLWp/GbNot99iVhU0nA8mHaX0OAGIlxAnND6EXwfYQWUfksE6YfXeVG1wx5gBTRfqBn6l9
	8vluMHKL0OO6/iTDeJyg1TjJ7BaHTLJuiRIyfl6V2cnWx/0ke5JvTWLdK8qCuLuLPv6wKdc6jRO
	pGsf7KknHKQ61eTO23NiUgFPO8UrogscSyho3ULd3eOqH1Jx86u+LUkfnpZQNXSmLS7cmn+rSWB
	YmxQbfC/VRfV5ZuhwXh1mT5gCuqbXf/65JoObaT5v8KfmJINy2/HU=
X-Received: by 2002:ac2:5dcf:0:b0:5ae:bb19:1864 with SMTP id 2adb3069b0e04-5b2f4b90286mr1828052e87.21.1786063301532;
        Thu, 06 Aug 2026 17:41:41 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f2b86sm189232e87.66.2026.08.06.17.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:41:41 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Vitaliy Sochnev <sochnev.v.74@gmail.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated list:AIROHA ETHERNET DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:AIROHA ETHERNET DRIVER),
	netdev@vger.kernel.org (open list:AIROHA ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: airoha: npu: load the firmware without the sysfs fallback
Date: Fri,  7 Aug 2026 03:41:08 +0100
Message-ID: <20260807024125.434055-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_174144_620854_06AA7E74 
X-CRM114-Status: GOOD (  17.17  )
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

airoha_npu_load_firmware() maps a missing firmware file to -EPROBE_DEFER
so that the NPU can be brought up once the rootfs carrying /lib/firmware
has been mounted. That mapping holds only as long as request_firmware()
reports -ENOENT.

It does not when the sysfs fallback is in play. With
CONFIG_FW_LOADER_USER_HELPER_FALLBACK set, or with the fallback armed at
runtime through /proc/sys/kernel/firmware_config/force_sysfs_fallback,
request_firmware() hands the request to a userspace helper, waits out the
full loading_timeout and returns -ETIMEDOUT. The -ENOENT test no longer
matches, dev_err_probe() turns the result into a hard failure, and the
NPU is left unbound after stalling the boot for 60 seconds:

  airoha-npu 1e900000.npu: Direct firmware load for airoha/en7581_npu_rv32.bin failed with error -2
  airoha-npu 1e900000.npu: Falling back to sysfs fallback for: airoha/en7581_npu_rv32.bin
  airoha-npu 1e900000.npu: error -ETIMEDOUT: failed to run npu firmware
  airoha-npu 1e900000.npu: probe with driver airoha-npu failed with error -110

Clearing FW_LOADER_USER_HELPER in the configuration is not a dependable
guard against this, because unrelated drivers select it. On the affected
build the symbol was turned back on by LEDS_LP55XX_COMMON, even though
the platform had explicitly disabled it.

request_firmware_direct() sets FW_OPT_NOFALLBACK_SYSFS, so a missing file
is reported as -ENOENT whatever the firmware loader is configured to do,
and the deferred probe path works as it was meant to.

Measured on a Nokia XG-040G-MD with FW_LOADER_USER_HELPER=y and
FW_LOADER_USER_HELPER_FALLBACK=y, on two images from the same tree
differing only by this patch: without it the probe fails with
-ETIMEDOUT after 64.5s and the NPU stays unbound, with it the NPU
reports its firmware version at 3.7s. The fallback is compiled in and
forced in both cases; the patch does not disable it, it only keeps the
driver from falling into it.

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Cc: stable@vger.kernel.org
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed95..ca33e615a 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -202,7 +202,7 @@ static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
 	const struct firmware *fw;
 	int ret;
 
-	ret = request_firmware(&fw, fw_name, dev);
+	ret = request_firmware_direct(&fw, fw_name, dev);
 	if (ret)
 		return ret == -ENOENT ? -EPROBE_DEFER : ret;
 
-- 
2.55.0


