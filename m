Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EA9C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8j1oeBxiPDxwX4ROesHG+Bp2/ullMBv6CggItOgqvC4=; b=1BSW1TK6gkylF4pyyeBA6fWzdN
	yz9191oyUbSbnUwA7d1J1kyJLypzSxmtNvt8+nWv/bZ3gGSc67DpdeWtSTLMJ73OaME3oSJ18oMD9
	193OS64ACQ55pF183mD3P129fN2ECdkjXBuWC+tYrl+wprA5BAlcJ8yT9Y4rdQENF+CiqNPPmGLVR
	3LTjXgYOpKNUkTlMWKLZid7/389J9Q1V/uyVL/ATLL364a1bkKAE3HBuJoroFc8Wl28AJp+kznVQD
	HMgrEwub3oEEoEstleXFDaIf6CFPkh+nsFyx09nzl4ozJozbjF193JzFUHIMIqDlsfufjS45CbkON
	vB5tUMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fd5-00B5nV-0v;
	Mon, 29 May 2023 16:21:55 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fd2-00B5ks-1I;
	Mon, 29 May 2023 16:21:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685377277; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G6RrffxUDiN+rZn+9hraKJiGExfBO786rQeE7OvaQhxbItkiMP/2C0UDRHwkK0fW54XKv/G9iQGEz790VLYcY8mAfLuYlylgu2EFCh9zvdT4pvNuLdEZONWI0fbfCg9+JbqeK2KWX1ZFB1sUVsHYKzcrwh5DzVcE6N5pg/jipOw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685377277; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=8j1oeBxiPDxwX4ROesHG+Bp2/ullMBv6CggItOgqvC4=; 
	b=gQUoOGoz59aIRVf8TQB3FHbOKf9YIQXskCaCNqE7gntmgL2LM7y7o+hKKBeQtrIimXv7zNp1/I0yCOx0JOvlreug6G1215YCRmgVcBvjdV37MqV7zIpYgz2n2A6SDHk9ZHtOamQLLTeU/1WHXcIQq40gq3drK//6dwBv/EDWFPc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685377277;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=8j1oeBxiPDxwX4ROesHG+Bp2/ullMBv6CggItOgqvC4=;
	b=SWIP1fVhQuhfHxUL8jt8wfrhEYINJencl0HjEckbZ9+PIrWMKMVQVj38HNsamiwp
	aiL0WS01JygLIDF6N4434Ro3o4m/QmnYIw8l/lBf2CaIgmVVOHOb21sFChoKXXTqMqu
	2RycejX3411nD0kyZf84uSWm+tMPZO/jGrbacoDi9s4BrU2zvRVzRlqp9MXpZDy+aCz
	kaLe7j/ycJ9StOAQNaOaPKAuQsZJmvRE2yKh5Wgk8ILV9JDlpzQJ9BkMI8HEfDkc2EM
	9YIgsZA9EwZq8bvXbV4vNU22ZHQ5a1Lxs15wInxACrVdOJfzfwktZUBLf99DfE4A9Lj
	aQ9TY8OpIA==
Received: from edelgard.fodlan.icenowy.me (120.85.97.71 [120.85.97.71]) by mx.zohomail.com
	with SMTPS id 1685377276027350.71344157850797; Mon, 29 May 2023 09:21:16 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kang Chen <void0red@hust.edu.cn>,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/2] thermal/drivers/mediatek: fix a regression affecting other subsystems
Date: Tue, 30 May 2023 00:20:54 +0800
Message-Id: <20230529162056.3786301-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_092152_512584_991CDAB8 
X-CRM114-Status: UNSURE (   9.96  )
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

In the commit I reverted as the first commit of this patchset, the
of_iomap function call, which allows multiple mapping of the same
physical memory space, is replaced to calling devm_of_iomap, which
registers exclusivity, and on my system (mt8173-elm), preventing display
from working.

So I reverted it, and to really solve the problem that the original
commit wants to solve, I read the source of auxadc-thermal and realized
that the address of these two memory blocks are not saved after probe,
and they're only used when initializing the thermal sensors. This leads
to my final fix, which is the second commit here, that adds of_iounmap
just to the probe function.

Icenowy Zheng (2):
  Revert "thermal/drivers/mediatek: Use devm_of_iomap to avoid resource
    leak in mtk_thermal_probe"
  thermal/drivers/mediatek: unmap foreign MMIO after probing

 drivers/thermal/mediatek/auxadc_thermal.c | 46 ++++++++++++-----------
 1 file changed, 24 insertions(+), 22 deletions(-)

-- 
2.39.1


