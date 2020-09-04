Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88750C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 16:43:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4668D2064E
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 16:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BVE9eh27";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vV07QlSQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4668D2064E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H12DSlGyQsC7KOnSBF5UxYYGX8htPJEFFS/dCEBDH2c=; b=BVE9eh27a5Nc9C6HhIhtJLVlTL
	nKj0lEqR4nJ/9H3u0d6cOomXHTvAQx+nBS6BhigAA4D9ZslGLONNcKfpRktRzkNuddnip0tt6OfP2
	maOa/TVj8UFjddgBGyEF+XLcWuzginYgjLjwvPcHWXsc9U8P+AR53N2c+9wTjoQbLzktuK/6gT6YB
	s5iaQWXk18Q8dZWOEbbCOcwAHu3DET2T1yZmjqUk4Gkd1XlyGGJAmoJJhJmDw37Ow9WFxHlikdbGz
	k9R2hpvJDg0h9RVBZHQiFeaNH91rzLMVMqlL2OcyrltkqYIZnqONH1wwSNAZLL+Wl61pJgsuWeSpX
	y1Ywll1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEoX-0003Hp-IH; Fri, 04 Sep 2020 16:43:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEoR-0003Eo-V5; Fri, 04 Sep 2020 16:43:44 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D3362064E;
 Fri,  4 Sep 2020 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599237823;
 bh=nxciuoD47KxGkOpJC1/Yb+VqPBHDhps24SnDZPx4IXk=;
 h=From:To:Cc:Subject:Date:From;
 b=vV07QlSQWiamQPiw7TcgBV0AVn8g3VLYp4Y0YEpQajmWoDymFi6NXno5wrMIrWqbk
 IYPI85Ll5xGRHSi6KObRaeEGTM/DoL18I/V+Yzx29NgruQPi31ggY144MQCLaytdIg
 uZHZpn9PJ/8lwmzuvIfusuOcx36eP0X6eMPZ8fYk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Prabu Thangamuthu <prabu.t@synopsys.com>,
 Manjunath M B <manjumb@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@axis.com
Subject: [PATCH v2 1/2] mmc: host: Drop unneeded MMC dependency in Kconfig
Date: Fri,  4 Sep 2020 18:43:14 +0200
Message-Id: <20200904164315.24618-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_124344_067366_4550BF0F 
X-CRM114-Status: GOOD (  14.70  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QWxsIGVudHJpZXMgaW4gS2NvbmZpZyBhcmUgYWxyZWFkeSBwYXJ0IG9mICJpZiBNTUMiLCBzbyB0
aGVyZSBpcyBubyBuZWVkCmZvciBhZGRpdGlvbmFsIGRlcGVuZGVuY3kgb24gTU1DLgoKU3VnZ2Vz
dGVkLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+ClNpZ25l
ZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCi0tLQoKQ2hh
bmdlcyBzaW5jZSB2MToKMS4gTmV3IHBhdGNoCi0tLQogZHJpdmVycy9tbWMvaG9zdC9LY29uZmln
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZyBiL2RyaXZlcnMvbW1jL2hv
c3QvS2NvbmZpZwppbmRleCBiOTVmNzlmNTMzOTUuLmVlYTAxZmRlMDU5MSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tbWMvaG9zdC9LY29uZmlnCisrKyBiL2RyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZwpA
QCAtNDIyLDcgKzQyMiw3IEBAIGNvbmZpZyBNTUNfU0RIQ0lfSVBST0MKIAogY29uZmlnIE1NQ19N
RVNPTl9HWAogCXRyaXN0YXRlICJBbWxvZ2ljIFM5MDUvR1gqL0FYRyBTRC9NTUMgSG9zdCBDb250
cm9sbGVyIHN1cHBvcnQiCi0JZGVwZW5kcyBvbiBBUkNIX01FU09OICYmIE1NQworCWRlcGVuZHMg
b24gQVJDSF9NRVNPTgogCWhlbHAKIAkgIFRoaXMgc2VsZWN0cyBzdXBwb3J0IGZvciB0aGUgQW1s
b2dpYyBTRC9NTUMgSG9zdCBDb250cm9sbGVyCiAJICBmb3VuZCBvbiB0aGUgUzkwNS9HWCovQVhH
IGZhbWlseSBvZiBTb0NzLiAgVGhpcyBjb250cm9sbGVyIGlzCkBAIC00NTgsNyArNDU4LDcgQEAg
Y29uZmlnIE1NQ19NRVNPTl9NWF9TRElPCiAKIGNvbmZpZyBNTUNfTU9YQVJUCiAJdHJpc3RhdGUg
Ik1PWEFSVCBTRC9NTUMgSG9zdCBDb250cm9sbGVyIHN1cHBvcnQiCi0JZGVwZW5kcyBvbiBBUkNI
X01PWEFSVCAmJiBNTUMKKwlkZXBlbmRzIG9uIEFSQ0hfTU9YQVJUCiAJaGVscAogCSAgVGhpcyBz
ZWxlY3RzIHN1cHBvcnQgZm9yIHRoZSBNT1hBUlQgU0QvTU1DIEhvc3QgQ29udHJvbGxlci4KIAkg
IE1PWEEgcHJvdmlkZXMgb25lIG11bHRpLWZ1bmN0aW9uYWwgY2FyZCByZWFkZXIgd2hpY2ggY2Fu
Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
