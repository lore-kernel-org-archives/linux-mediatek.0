Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746D7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuuzCKEiVlC8QE88s8ikMz6Zg53cNU+CC6xCwPGs1fk=; b=A/HaSPd+iMOQ5e
	7x+mtGY9LsK0hE84jv2YUs1Stqo8vFbkA9TnnzA0lba6dJM8imwMGywvqgYpj2UMKMNK6MfbgdQC6
	Uz+aLjIsHR7KBtnXCc5k5lYCR5Nmqyh0QRZijyAoq0HFldXuqVrRap4oVELbG6yh9mRGewxjGpAgr
	C3HS680LO3Ln/09baxmDJxSO+li2i3PzNCzcRTvaACafUmpbwsJjHb6E4pG9OgFw74vQY02u7B6Fl
	QXTGO2OUzVzVHy6GZKNMJAA9B+PzWFoC5MhCb2fYn8GTWBh2M+4Xj27S2HOeHzmKr2jyKpcYAmjC6
	MQvY1AhHdMnnjuIkkoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neCyY-00CypB-U7; Tue, 12 Apr 2022 09:38:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neCyK-00CyhH-2v; Tue, 12 Apr 2022 09:38:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30C2DB818BB;
 Tue, 12 Apr 2022 09:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282BCC385A1;
 Tue, 12 Apr 2022 09:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649756281;
 bh=Z8H3j7wqi5e1lG2YLJp1rEvzi3mZVYDKfcLpQYqvVss=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=c3zVsyjuMlxbotIc42Vq0cYT4ydjtAY1ae1gbMIYRsylDj/1ckf2B74QKGTczGsD2
 o8EhhejnQbt6nIerFou1kYwlZAdjZKE/1PZr03g41cgtkaPeFwunWunWVjGgH3z0T1
 cWdlS0yGFjY/PPHOYZ9XHLhye+bsqjxh1qGl6wzclsST2k9keMAwwrN6BiSGSABVGw
 9MBoRR2WibvTpeDUj3LeexDgCp9pz1e5IY0gNeOFFBlN1SXaFcThO1ZQSsJbz/Scsg
 PaooJ7TgY814dyHkDzQ7mLRc3MfjhdXfkQgRu7gInh3tlXlZR/D5c0WNG9x/Ti16a+
 SwFhheUZov/gA==
From: Kalle Valo <kvalo@kernel.org>
To: Philippe Schenker <dev@pschenker.ch>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 linux@leemhuis.info, "David S. Miller" <davem@davemloft.net>,
 Deren Wu <deren.wu@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, YN Chen <YN.Chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
References: <20220412090415.17541-1-dev@pschenker.ch>
Date: Tue, 12 Apr 2022 12:37:50 +0300
In-Reply-To: <20220412090415.17541-1-dev@pschenker.ch> (Philippe Schenker's
 message of "Tue, 12 Apr 2022 11:04:14 +0200")
Message-ID: <87y20aod5d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_023804_316639_25303DEC 
X-CRM114-Status: GOOD (  11.24  )
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

Philippe Schenker <dev@pschenker.ch> writes:

> This reverts commit bf3747ae2e25dda6a9e6c464a717c66118c588c8.
>
> This commit introduces a regression on some systems where the kernel is
> crashing in different locations after a reboot was issued.
>
> This issue was bisected on a Thinkpad P14s Gen2 (AMD) with latest firmware.
>
> Link: https://lore.kernel.org/linux-wireless/5077a953487275837e81bdf1808ded00b9676f9f.camel@pschenker.ch/
> Signed-off-by: Philippe Schenker <dev@pschenker.ch>

Can I take this to wireless tree? Felix, ack?

I'll also add:

Fixes: bf3747ae2e25 ("mt76: mt7921: enable aspm by default")

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
