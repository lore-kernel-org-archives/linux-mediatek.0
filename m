Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D38C83F12
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rgsialx6U5S1mQ8Q3KtrOdwxAf//GWzciOGkiJxvsAk=; b=31OM0fQXIgi8jG5VStxoJrsvA6
	l8DnSkONRpD6CJY+tXnmF+cI/hMDd93twG6xT7N/MdibJ4G7QZLmW8u1BpzsUqqgpcHqYqhjKiBjJ
	qRPdbV+3HaHiCDr2CH5+SmwmYQRV2go5vzcGNrgZFX/gpeu7kbuY+GJck0OMzQ7khFFVDN+CoTsSE
	+f3bmHZ7ebNw7wLOiagm3SiE0M6G4XwEHwZogmK0PMzQiWbPBaaGazVLJenilnED2sSkVg8DUnvZg
	pQJC9wA/YarzyThtodX5a8cZEwAuCHVKZTnrrOxLapGaKWMekMb3aMnQUkLuEHLf3bdk3eqf0KlDD
	jmh59yqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qasJw-00AsJl-0O;
	Tue, 29 Aug 2023 06:35:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qasJt-00AsJD-2F
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 06:35:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B1706201C;
	Tue, 29 Aug 2023 06:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DA1C433C8;
	Tue, 29 Aug 2023 06:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693290919;
	bh=h15yCxDP+AAVrnEMRaUoiOk0FC3Rz5ZP/Z8yABXlJPI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bJAIBH64mj/nBe/HjNBr71EtO5QfyspviHg+ZHTaBzYZvVQGOURh7AeEVB/7KUV28
	 vge5oQ6wdS8aB4IZlZxtog23+q0xiMQXbaw7aEMofZfK4nByJpCmwGqDRIKr1ShXze
	 voxKHuYLaxfWe7soye6DcWaciQk1q6RzQ2KYK1kZ6idgD4amGQaMe3NflTdzwKeuc4
	 7+MzL0pvlh5pxlFhlwrIe56oiNIBE/M+oirBKPs++TYuZqlhOO1lcQDElAJO+lmumq
	 Ow7m5HaVeXrnyriwwSuryDmFwyXZehHo8t8YlJSdsx3PfsFwUlxqqZMJ1aXezeczIH
	 Umv+HHf9IvdmA==
From: Kalle Valo <kvalo@kernel.org>
To: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Johannes Berg <johannes.berg@intel.com>,
  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Ryder Lee
 <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Evelyn
 Tsai <evelyn.tsai@mediatek.com>,  Money Wang <money.wang@mediatek.com>,
  Peter Chiu <chui-hao.chiu@mediatek.com>,  Benjamin Lin
 <benjamin-jw.lin@mediatek.com>,  <linux-wireless@vger.kernel.org>,
  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 5/6] wifi: mac80211: export ieee80211_tpt_led_trig_tx/rx
 for driver
References: <09f0cb7f314a08eddb77298411d965ad30a847bb.1692983967.git.yi-chia.hsieh@mediatek.com>
	<8d18b7ac7fc394c310c0f2730da9ee7e955a9860.1692983967.git.yi-chia.hsieh@mediatek.com>
Date: Tue, 29 Aug 2023 09:36:28 +0300
In-Reply-To: <8d18b7ac7fc394c310c0f2730da9ee7e955a9860.1692983967.git.yi-chia.hsieh@mediatek.com>
	(Yi-Chia Hsieh's message of "Fri, 25 Aug 2023 10:47:08 -0700")
Message-ID: <87il8ytkwj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_233521_794766_83439B98 
X-CRM114-Status: GOOD (  14.40  )
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

Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com> writes:

> Whenever the H/W path is enabled and traffic is in the binding state,
> mac80211 is not aware of the traffic. Consequently, the LED does not
> blink for that reason.
>
> The ieee80211_tpt_led_trig_tx/rx functions are exported for the driver
> so that we can report the tx and rx bytes from the driver when
> the H/W path is being used.
>
> Signed-off-by: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
> ---
>  include/net/mac80211.h | 17 +++++++++++++++++
>  net/mac80211/led.c     | 18 ++++++++++++++++++
>  net/mac80211/led.h     | 18 ------------------
>  net/mac80211/rx.c      |  2 +-
>  net/mac80211/tx.c      |  4 ++--
>  5 files changed, 38 insertions(+), 21 deletions(-)

The mac80211 patch should be first in the patchset to get more
visibility.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

