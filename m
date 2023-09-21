Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667E4E7D0AA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 21:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JXbCn/mxw/O38mq7z9Y2CPBqurZYPBI6LOlqJG8vaps=; b=PfETHQC1OcnpbM/ENcxUDZ6OJF
	/VrVvksUrwPzSWcu4bN5hgF2C8EpZX26ijjV3bczrCZNXMbt072BNBnBCgbxmN/L3LtIIkmGfkA69
	IOHitBSVaVklNViEoWcsVQOTD8CDVat0n04sX/M/FdCuMy6nPVFV2bC8AvQkZgE7M4fUcIvD59vNu
	HLVEFKr93fLXc7JdVKGeD1OnBORy3YAqyInHXzxFVMI9sf8iM72ehDONsSfCMpbkPNTM4q4WxbiWi
	A6rnjEQGFnPwRMQl05S3JHty6VKMHuu4/kAzhDGX8wIH13wIpVUO1dGSEYAc183nUGHVJYmhECgXx
	ziLfiH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQuE-007A3X-0W;
	Thu, 21 Sep 2023 21:08:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQuA-007A2e-2x;
	Thu, 21 Sep 2023 21:08:12 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E071366072A2;
	Thu, 21 Sep 2023 22:08:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695330485;
	bh=4WzhXX1uaBfz0iPkLduXsSe9s+j07QrDW6eVjUz4YQc=;
	h=From:To:Cc:Subject:Date:From;
	b=Xq+7sEqKMT1vt4K2chwQVwiFPZh87u8UZcHR85YtRTxEST+m/bOEzap9pEDI/jlvN
	 Bc2E4iawedB1CvcQfsWQ+SdjoYUMhCQ6w5uIybBe4T4KSyGY2ZH3qEyepqXCq8TylO
	 REOdNMAuaQ95GP79HV1mStHUe0Zb1hued3xRm6AhJgpipF59NKVzsvi9fe2x3b4p0Y
	 dWp3gWQsUx+IbolK/IvPrioWEF97/lKb6ENurhUFp9thNde9DqTs/n15P4CGbvoyO5
	 w/glxgy8t7xhjp2/QuKtQ1ZHA2VftQ23iKelU92xiazICGo+rMJeA9B2Wq76p6J1Am
	 p6bhSKYwpqY8g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH] kselftest/alsa: Add configuration for mt8192-asurada-spherion
Date: Thu, 21 Sep 2023 17:07:42 -0400
Message-ID: <20230921210800.230330-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_140811_121006_0FAE619C 
X-CRM114-Status: GOOD (  21.56  )
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

Add a configuration file for the mt8192-asurada-spherion platform to
validate that the card and PCMs used for speaker, headphone and
microphones (internal and headset) are correctly exposed to userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---
Sending this patch as RFC because I'd like to ask a question. What would
be the most suitable entry to identify the card in a future-proof way?

I have used the card ID here, but given that it is generated at runtime
with the purpose of being unique among the cards present on the system
(and I couldn't find any documentation that states it is stable), I'm
not sure it is supposed to be relied on.

The card ID is derived from the driver name or card longname, which are
themselves stable given userspace (alsa-ucm-conf) relies on them, but
those aren't exposed through sysfs so I can't check for them here.

Another option would be to look for the card number 0. But in the (very
unlikely) case that another soundcard would be connected to the platform
and detected first during boot, it wouldn't work.

Yet another option would be to look at the device's uevent file for
the compatible as defined in the Devicetree, ie

        path "device/uevent"
        regex "OF_COMPATIBLE_.*=mediatek,mt8192_mt6359_rt1015p_rt5682"

Though it is possible (in rare circumstances) for the compatible in the
Devicetree to need to be updated to enable a driver behavior that isn't
backward compatible.

I realize most of these issues are very rare and probably won't ever
occur, but it seems worthwhile to use the most future-proof mechanism
available to identify the card to avoid unnecessary maintenance, even
more so considering the example would be followed by future
configurations.

Thanks,
Nícolas

 .../alsa/conf.d/mt8192-asurada-spherion.conf  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/conf.d/mt8192-asurada-spherion.conf

diff --git a/tools/testing/selftests/alsa/conf.d/mt8192-asurada-spherion.conf b/tools/testing/selftests/alsa/conf.d/mt8192-asurada-spherion.conf
new file mode 100644
index 000000000000..6a7e15dc17da
--- /dev/null
+++ b/tools/testing/selftests/alsa/conf.d/mt8192-asurada-spherion.conf
@@ -0,0 +1,32 @@
+sysfs [
+	{
+		path "firmware/devicetree/base/compatible"
+		regex "google,spherion"
+	}
+]
+
+card.mt8192 {
+	sysfs [
+		{
+			path "id"
+			regex "mt8192mt6359rt1"
+		}
+	]
+
+	pcm.0.0 {
+		PLAYBACK {
+		}
+	}
+	pcm.3.0 {
+		PLAYBACK {
+		}
+	}
+	pcm.10.0 {
+		CAPTURE {
+		}
+	}
+	pcm.11.0 {
+		CAPTURE {
+		}
+	}
+}
-- 
2.42.0


