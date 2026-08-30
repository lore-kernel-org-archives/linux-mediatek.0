Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB432C61DB9
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2026 19:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qK6iwww5JrQ3vyns8B4jz2tWg+m13M7aEYKC8BhkdtA=; b=lv6/mAWfubq40lwyr0hdwqNuU+
	FphoECW9VVyyYYQTQCY1otWn+EgkhoVYmwPloNLbFX7grmB0pv8OfP2ZVL9xHLaZPiVvu1Ts72tlF
	NYzr3dbdBqkq3ovvpbEBQg070vjxzmxsiIj43JjUsIt/+DmPG1W2vmYJQxbbwDsL5uqW7WTnkK09s
	BcoRjCUnChXkiG7hl/V3yAHvLWagK8Xc601j1Wbk3BImZB4tmED620OpEEiOYLLz0Yqz9VyLCTS6R
	Fb7aoqV9MGd3FouqNCarrbp3WjikbNEJ5IAEDmWS0tyf6Mp1Btwx7GB4FKA8F3lZZUDTA0KUF1Cvv
	rJvqEMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0klf-000000080em-35Sj;
	Sun, 30 Aug 2026 19:00:35 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0klc-000000080dw-3U6t
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Aug 2026 19:00:34 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qK6iwww5JrQ3vyns8B4jz2tWg+m13M7aEYKC8BhkdtA=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788116430; v=1; x=1788721230;
 b=N3WsvEUepD08+u/oQDVNHrn50lmx2w6H2h3uumz0aUiYH/I4mxt2jotN+XB5Ne0wBSz99v0Y
 UYy7hhgrzu8oc6Sm+foFLqj5fzzlHuqh9zovD1SSunlOe1BafD9cCiIfSyQ2OC9q61d4k62cNUx
 jy/0EQ7yaEYwqByxdF9QVwUWA6fALTOz4m+gpy48fGus5Hsoo4ROw/2cTbyfGgpTOop18jApWsV
 alfWoo+UnJ/NwVQ3B4V25QGTnAnboAyjE2hhpLaAuh1cGgxttOXX22BhS0DkWJw/0/qbfs9flSW
 Xhr1E6PGLfnKNif4BoNWciM0/GESRmmqH8s2Bat++dfyw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 430c9ddc9c3fcc46;
	Sun, 30 Aug 2026 19:00:30 +0000
X-Mizu-Trace-ID: 430c9ddc9c3fcc46
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Thomas Hilber <anthrop@enxio.de>
Cc: linux-wireless@vger.kernel.org,
	ath9k-devel@qca.qualcomm.com,
	linux-mediatek@lists.infradead.org
Subject: Re: AP drops STA data frames for ~130-170ms after 4-way handshake
Date: Sun, 30 Aug 2026 12:00:28 -0700
Message-ID: <20260830190028.20209-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830104236.521389@enxio.de>
References: <20260827074442.826644@enxio.de> <20260829232532.29622-1-lucid_duck@justthetip.ca> <20260830104236.521389@enxio.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_120033_460542_6309A785 
X-CRM114-Status: UNSURE (   7.26  )
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

On Sun, 2026-08-30 at 12:42 +0200, Thomas Hilber wrote:
> It goes with it, and it takes the whole effect with it.

Thanks for running that. Six of 216 against 292 of 302 does not need
arguing.

I have it on an MT7922 built to your AP2 spec: 27 of 95 associations hold
134 to 189 ms after the handshake, which is your 130 to 170.

They are held, not dropped. On a slow cycle my station's attempts go out
every 5 ms for 150 ms and none of them reaches the access point's
interface, until fourteen arrive within sixteen microseconds of each other
and every one is answered. Across the capture the station retransmitted
three of 110, so they were arriving all along.

A monitor radio says why. Over twenty-five associations, every request to
open a block acknowledgement session declared a starting sequence number
of zero, and zero never arrived under any of them: the first frame after
the request was one, two, three or seven. In fourteen of them the station
had already sent zero before it asked for the session.

So the reorder window opens on a sequence the station will not send. The
first slot can never be filled, everything queues behind it, and the
release timer is what eventually lets go.

Worth a look in your own captures: the starting sequence number in the
request against the sequence number of the first frame after it.

Devin

