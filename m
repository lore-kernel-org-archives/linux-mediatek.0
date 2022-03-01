Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86DEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXu+IqfIOfrxEvrIWhH5eHb+5+pLUCRvbUwXQVduVZE=; b=MwRLZfm2hRjgap
	zTbhTroUw8DzFbWxhMs0GZmUXlrgsr02Erjur/SS8QtyutQnCrlIrmJ4PKKdBsruY4j6RaYkkxvKj
	IELeO+xuh3gA97ERVQVwBzJhITKCbKIiQTm3hZ1yZ/gx3ZHBE9Hrp57hHTdjIfyhLZbHd3HLJ2mDH
	KBqDLh3qjHCcbRfFCbx4zI5+CbRKo4+iLSYEyzPQhzCbxubwRmG5WSk8d1vD5NT0ED/jA6ORqVLdY
	66NHfdjudAhDVnlmRyj7wyJqSiYJX+S23og9Sp6iLho3grFfV2VEpgo08nNBz+eD7uQXCicyXre3P
	uPn7/n07eqTSWC3+HxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP1ao-00GXyC-31; Tue, 01 Mar 2022 12:27:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP1ac-00GXvQ-2x; Tue, 01 Mar 2022 12:26:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 1E35A1F42827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646137605;
 bh=9NMYT5GTQXgmmpSeRgMayYIsfg6kQLz4BasTs0OF7Tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n6oKlhDyahEo9QO2MflYK0uTJ2gPIJj/ZcVQpWXEYZtihtoY8unlyi1pHTmRFpuxK
 RNIjLgsZCKOn2X3XH8VfylQkoe15GWo23KFS3zueAEni4gKC7F3LvspC0KPWDxZfa6
 Nagw3EGoytGy3T69jwa0XQj47kXkYo6GHLOncoIFwEvPNhjRDrr+ahmRDUlq+V7loX
 /tyvwRgmtFE3//ASeJ0AfScuLHiRnlh9aqdIwvce/zQqNwglhHAFVWeXHltqGbHuM4
 rFSzQdkRk0Up2zjHs6cd3savhWkqOSwFA6pzy1rVf/UTPI2eaQDCvMEkykmz1xYehr
 EeXgka0/ayOgw==
Date: Tue, 1 Mar 2022 07:26:38 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Robin Murphy <robin.murphy@arm.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nick Fan <Nick.Fan@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] soc: mediatek: mtk-infracfg: Disable ACP on MT8192
Message-ID: <Yh4Q/qBX9TjPbtzx@maud>
References: <20220215184651.12168-1-alyssa.rosenzweig@collabora.com>
 <e93b12d6-5c7b-2ad6-47e5-c1311d95cba2@collabora.com>
 <470ec036-b402-2cc2-94b9-75ebaff342fc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <470ec036-b402-2cc2-94b9-75ebaff342fc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_042650_392961_EBE34D50 
X-CRM114-Status: UNSURE (   6.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Patch applied. I fixed the commit message by deleting the v2 note.

Thank you!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
