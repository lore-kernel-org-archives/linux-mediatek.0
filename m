Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882D4C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7nyw3RVK2gi+fT/LQqVZzVFaNPSYHxiSzqpCzA7yqI=; b=3wP6Juhi/c/sWt
	jqMGgUj8NjfTOAPz6RLOOgorNzPqu7+ufSh58FS2YfSghJuM0/W/5O0dm6UOmurFzCSM05cEUWd/0
	j0Pt7YU4u7qEzdgl/q5cNV6pwYWgyPJqhB5gqidKvAM4dsK78RCvdK93EySsmZ+uA1ZjMVOodwR7B
	yVpn9+jkTYid3Aoa7InOeTf1ui6krtuXeoSPC91hTwiw+GtxX61vgmAgtbmlxZIMZpYAw2CCy6vKK
	WmqFWhlVZl+ZN1Kv5OdqCB1QJzRbTZnhnBvIiQtajwn0DXRo5C+lElc7Vgn5RILFBL/erHceBuX0m
	+K/j5kemhw1FvYn1piWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncRRw-00BujK-6F; Thu, 07 Apr 2022 12:41:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncRRt-00Buhc-Ec
 for linux-mediatek@lists.infradead.org; Thu, 07 Apr 2022 12:41:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C98431F46263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649335276;
 bh=UZfegCPd2RthtHEiBUdmuemUwEzaqmYb4F7AmIXnuDg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cVg/1i2fxKSdBqwnIbNfbxidpi4upKD/fUKbTwnjgIVV18vZm8mBARhAdjCmjvP/a
 jtBvntd1wO2QPDtb7zXvqJJaiKEzWKJHxvFTf1+Yi/ZSwEg9GMgujoqonJf8QEO9HW
 568nuONe5+esT8KrX/SJofzTFupOOAw9Xh5A/e9XbAOAAEKdMn5sLRbOxz30CaFz80
 Wv8qtnFwB/aGxK8jU6pEY1NkVPZZ/X2/LG1cxnbkvPLJmE2TwiyPxAXo3E54qpV1Q6
 Y4J7IvQ/+Tiu2lCb5LGNN6ttX3kae+YMyzDF+xE0hu1VnligdHEeyQi1T1CPuSUXZD
 9qQXygc0CLtIQ==
Message-ID: <511692d7-bc9c-bcf0-3a1f-9825eb6790e9@collabora.com>
Date: Thu, 7 Apr 2022 14:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] mt76: mt7921: Add AP mode support
Content-Language: en-US
To: sean.wang@mediatek.com, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <8868a55bcaec80822e5b671c7a6023583d1b16b0.1649269260.git.objelf@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8868a55bcaec80822e5b671c7a6023583d1b16b0.1649269260.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_054117_685083_DBD0FD3E 
X-CRM114-Status: UNSURE (   6.09  )
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

Il 06/04/22 20:29, sean.wang@mediatek.com ha scritto:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> add AP mode support to mt7921 that can work for mt7921[e,s,u]
> with the common code.
> 
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Tested-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
