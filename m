Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F1CC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V5VQPxQG5hYfM3ZYa9ViajjxMf57nECwH0fT1Bw3N9M=; b=NoEbQM2MTh7K5h6IE3Dj/fJ+o5
	OacNsSvn6609EUMy9v2aUn4CQ5/zb20sQ/ixLlE2xt/36YLXcOHSGbCr+Huavv3qNqOwE86Yae67e
	/+F4Qid4itdt+G58NWtcfAH4RBFh/htme8IP2ZCgGN8EH3h6xfhUY0GDE9pv1ZDp1E/UtpMSjHtzx
	ylnHFup6Zr/A8haACkGxChkoNp72mqHmiLACVoXRzcJeSPnXp2fF3cpsOc3SIYYA8d1o9UrJQCUGy
	PVGfv1U7s+WRwFZaKhrSv1o61iJ6V96MwbLOlu6RWJQArpUH/sgaW3mZxhknwqQYygMBEManUkQWm
	f5/9mASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBpLP-0000000H6Y2-13YT;
	Tue, 28 May 2024 05:25:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBpLK-0000000H6X8-10MN
	for linux-mediatek@lists.infradead.org;
	Tue, 28 May 2024 05:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716873946;
	bh=CyZTXXa2iMUonSsiilt2DD2P/g/+qRDX4b1zOC+LFI0=;
	h=Date:To:Cc:From:Subject:From;
	b=3PivAxFpNaXxBPWm95z+j1BvJMDiIxZP6s/4Gxy5vhUMsfqp2Dk80VefOv5W8qICT
	 HChJ4U7IlVpmFAMz4MQvuGvhkpuNwfZDc68QGh4zY81ot6Dgpw/kza2M8IxPzP1WPY
	 s6iNw5fFsGJ1zz91oXXr8RAgbriXw+bTfW8EAB/fTuX5H2YaO5ZOO1Ll01+WETceFv
	 Pk3ABi0C+8ZKpkAvnVVEzJ3vEEtftNZHS8llSCXDzlBDOVOm1FGnikoVIXNIRquGYj
	 uzoTAS9PEy8PUw08TAoAVBv59xyJ71G69KAgETpe5XzvNC4Q11aYrWjmDma9045GsJ
	 XM5jb5znEhxyA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 15C113780480;
	Tue, 28 May 2024 05:25:43 +0000 (UTC)
Message-ID: <0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com>
Date: Tue, 28 May 2024 10:55:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com, daniel@ffwll.ch, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: flaky tests for mediatek driver testing
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_222551_069154_B8026403 
X-CRM114-Status: UNSURE (   3.45  )
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

Hi Maintainers,

There are some flaky tests reported for mediatek driver testing in drm-ci.

# Board Name: mt8173-elm-hana
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
core_setmaster_vs_auth
dumb_buffer@create-clear
fbdev@unaligned-write
fbdev@write
kms_cursor_legacy@cursor-vs-flip-atomic-transitions
kms_prop_blob@invalid-set-prop

Will add these tests in 
drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

