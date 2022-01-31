Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CD7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqaOgCiVRlaOWj911dL19iDSIJj72tXbKekezj/nsnY=; b=QgO3LgphuIDEdN
	MXmztgLP2Q7DuaMcWJIKHhv6SZZ7k3LkFUDURVKJ1wWt2FKJpjXA2kIDU1mUIg68yqHU+IXzzXRhS
	ckkXPyCOvSE8N99332Rg0bYjKc9kYHm3951d1SKiwW8kbfVNK6O0P4OqwZg1Cgvgi7dRqjcVj/wxr
	26uyTDVq4XwUP87n5155lk3hr+bbD1n8Gh3sy6mhLAQje5ULbElnbYlebyUomRmlVboeo3poqUuvT
	BOqLC9xKdwanvwtyCS7lFfUPE39lP5AR0koK+RzXLB+xB7Sj1ffa/XmX7S1b00J6KbtvRV0NI4WVY
	FnQ4Vz9F94wFlYJS53Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZGq-009nCr-OL; Mon, 31 Jan 2022 16:11:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZGd-009n9H-EQ; Mon, 31 Jan 2022 16:11:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6C90F1F42963
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643645456;
 bh=CffkeDPQIGKCT7zt9bvQS9kahLagWK5zgsg2gxOqyoE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iMA15jgISWEGuW3lv7B7QDjXEtx4X4aZPCOlkNNkIl43zLQtSHnpfPwt+xq+yDeZ5
 +TDbK5oNPhKQgGDuX8eZvPihSaw7EIgP3oWAi27KcXY7abCoG2QQZUpWaq/xoTxM7Q
 X+f27m4EVb3oaW6R5Wcuqn05IMPaQZODbG9z3JpFQQ/BQgkuno3c1NdBk9pRE/fAxN
 fgG5J5qbqr2nrA7sVRKIWDG5fmRc8keGyJxa+jiw0lO1e2wgb0cuos06/CEnL8SeTS
 EFAWq+1B9ms3kfw+st1YPmCG4EefAONHtgXtcLyuLij5O4l7IPsPbef3ryxpR1pjYn
 wu3wUYQbZoicw==
Message-ID: <797cebd4-c367-e220-8ed3-6c1a69df4eb4@collabora.com>
Date: Mon, 31 Jan 2022 17:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v6 1/1] firmware: mediatek: add adsp ipc protocol interface
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, tzungbi@google.com,
 Chen-Yu Tsai <wenst@chromium.org>, cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
References: <20220128111832.22989-1-allen-kh.cheng@mediatek.com>
 <20220128111832.22989-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220128111832.22989-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_081059_655365_45362886 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/01/22 12:18, allen-kh.cheng ha scritto:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> Some of mediatek processors contain
> the Tensilica HiFix DSP for audio processing.
> 
> The communication between Host CPU and DSP firmware is
> taking place using a shared memory area for message passing.
> 
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> We use two mbox channels to implement a request-reply protocol.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: YC Hung <yc.hung@mediatek.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
