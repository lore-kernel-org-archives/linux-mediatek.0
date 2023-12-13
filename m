Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B038C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akdQg5r1DHQAgvaJdrvXSSG+bV+1cZ/Yv/BKskT+BTw=; b=ia4lxpvwSSl5+DW4dVxid0qX2b
	cMAzLx49ikdBvrPpXyUiVC6XqCQhrUXBeWaMM0KmtMXRSz6iZ9Kc3GTNnWpfAIHXuFqdJ6pj4/8u9
	OPGZOR5MV9BhA88Sa7+Nar57dj7aLGmShbW0FvzAGZE2RQ+qqB0Hf/bzbTzMATryRZ0uJur33wUUs
	2WMOjZ/NWslP+NKdNHh7WliBeGNwCj1nUYIOOoGOc8ePWCnJdfAy6t9v/Jk8AQLIreKBiuXarjwuL
	4Ed3XkGLkH3w3hTKFrsCjvLNuuGxWerqeALrnsOgASkoz8sII6HsSXIpo8UKjFq97uHSmqqP0xieU
	lO1trxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMag-00EG6T-19;
	Wed, 13 Dec 2023 10:35:46 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMac-00EG5e-2S;
	Wed, 13 Dec 2023 10:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702463738;
	bh=viWUiogueJVv5biI+umTb/N3GgCvcB5MX5R0x153QXk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=BaO6/junNe+bPVn+4mmm+vz+40b31nCMQ4BVQVdRiJFtHfoY2NSZRlQvbwv+XhzR5
	 p+GOUUfdmHof+/JzjsHOBBnpzLlkfpsWhQ3fSl2pwDrdlof8w7U0TSEKuDiFwgFA3z
	 dLaG+IvWQxnYzw8XoHd3vyk2f2sH68mYqmUTZxoqlkHnzFGHrBYKV8XuJbLvFmmS2R
	 olObNfym2FGRsRq1ygRLdfd3g6hqM6u8Ba+YeASQFv4VRSs+JTVVJWQ9ecMdd5s1VT
	 PUYzaqNNm/QP+/qSTEKEOjjgPhcd/W3td8ILXYs3o9ClAalXzcvntjdUqVqqW6Ks01
	 HBM3H3+TWvlzg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3BD363781453;
	Wed, 13 Dec 2023 10:35:38 +0000 (UTC)
Message-ID: <38909757-5b30-485a-8482-b75a36f1442a@collabora.com>
Date: Wed, 13 Dec 2023 11:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: mediatek: mt7986: silence error in case of
 -EPROBE_DEFER
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maso Huang <maso.huang@mediatek.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <b941a404d97c01ef3e30c49925927b9a7dafeb19.1702422544.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b941a404d97c01ef3e30c49925927b9a7dafeb19.1702422544.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_023542_957156_F7DFEAD2 
X-CRM114-Status: UNSURE (   7.67  )
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

Il 13/12/23 00:10, Daniel Golle ha scritto:
> If probe is defered no error should be printed. Use dev_err_probe() to
> have it muted.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Maso Huang <maso.huang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



