Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F9606A697
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NAwRV4bN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Bzwv3M0S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8GhEywsubufbkk+g2frlsncIbqrCxI1+Ey2LliPVLQk=; b=NAwRV4bNz4LRwL
	KNX4nch3lhUjkhKzpOfnlM57IGU1fFY6JH1V8hQxJv/VEp83/exuhtRhcEay3WCl1mW2qz9kmeKSp
	lP4Xy8Q3W9CFbFrL78ET5o2A5C/X0AJQcA6a4YtJ6n6DiUaUwu4PR1Y0XkvLgsAdf15cmHqtCXF/G
	e9RtyCxzGPwRvrcN6iaBSoXoeRLgQLQp20qsQwibOiVZx3XIeE80fOBiV5sJ1q/Z/qqYStCrHRDim
	PHvcIBo+sY3F42oEGCX+uD5ipBmeVN8G1WfpmcB/zFgxt1wM/yFH7p80+X59mTioXlx95hgM+4WOz
	oyAC30x49RMEXcTirtrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCzh-00000009ylc-3JY4;
	Wed, 25 Nov 2026 13:25:05 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCzf-00000009ykh-2ixM
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 13:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8GhEywsubufbkk+g2frlsncIbqrCxI1+Ey2LliPVLQk=; b=Bzwv3M0SLKpNf8QFPVchWFgJvC
	ULBXXM4V9osb81Yxy7mMLXkhzonJ0B95yDBi9YQETkSJHm9t990MO5L3eDy9EsWov5yuNPipWRth7
	R+pq0pleIMA2huLLRjLZ01ZW1P4ZtWAQXwvOl69/ACP745m1V0luUyTySzjFkFXhVDfM=;
Received: from p5b015e92.dip0.t-ipconnect.de ([91.1.94.146] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWCzZ-008Dhz-0g;
	Wed, 25 Nov 2026 14:24:57 +0100
Message-ID: <2ea4dc91-9235-4b54-ad7e-0fcefcb933e5@nbd.name>
Date: Wed, 25 Nov 2026 14:24:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] wifi: mt76: mt7925: support per-channel survey
 dump during scan
To: Michael Shih <michael.shih@mediatek.com>, lorenzo@kernel.org
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kun.wu@mediatek.com, deren.wu@mediatek.com, sean.wang@mediatek.com,
 quan.zhou@mediatek.com, ryder.lee@mediatek.com, leon.yen@mediatek.com,
 litien.chang@mediatek.com, jb.tsai@mediatek.com, eason.Lai@mediatek.com
References: <20261112075558.1813785-2-michael.shih@mediatek.com>
 <20261117032530.470475-1-michael.shih@mediatek.com>
 <20261117032530.470475-3-michael.shih@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Content-Language: en-US
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <20261117032530.470475-3-michael.shih@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_052503_816823_D28E66AE 
X-CRM114-Status: GOOD (  12.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,


On 17.11.26 04:25, Michael Shih wrote:
> Report per-channel survey airtime (active/busy/rx/tx) so that
> "iw <dev> survey dump" shows non-zero airtime not only for the
> connected home channel, but also for every channel visited during
> a firmware-offloaded scan.
> 
> Two accounting paths are wired up:
> 
> (1) Home/operating channel (periodic mac_work):
>      mt7925 is firmware/chanctx managed and never goes through
>      __mt76_set_channel(), so phy->chan_state used to stay pinned to
>      its init default and the periodic survey was charged to the wrong
>      channel. mt7925_survey_switch_channel() is added and called from
>      assign_vif_chanctx() to settle the old channel, re-point
>      chan_state/chandef to the operating channel, and re-base the
>      firmware MIB snapshot so active/busy/rx/tx keep accumulating on
>      the channel actually dwelt on.
> 
> (2) Scanned channels (scan-done event):
>      The scan-done CHNLINFO event now carries per-channel airtime
>      (firmware Ch-Survey extension). mt7925_scan_update_survey() parses
>      the per-channel array and folds the airtime deltas into each
>      channel's mt76_channel_state. The firmware 6G channel id is
>      converted back to the real channel number before lookup.
> 
> mt76_channel_state() is exported so the mt7925 module can map a
> band/channel pair to its channel state.
> 
> Usage:
> (1) Connect STA to AP and generate traffic:
>        dhclient ${WLAN_IF} -v
>        ping 192.168.0.XXX -i0.1
> 
> (2) (Optional) Trigger a scan to collect other channels:
>        iw ${WLAN_IF} scan
>      or use wpa_supplicant / wpa_cli scan.
> 
> (3) Dump the survey:
>        iw ${WLAN_IF} survey dump
> 
> (4) You will see per-channel airtime, e.g.:
>        Survey data from wls1
>            frequency:            5240 MHz
>            channel active time:  163258 ms
>            channel busy time:    34076 ms
>            channel receive time: 32084 ms
>            channel transmit time: 253 ms
>      - The connected/dwelt channel keeps increasing over time.
>      - Channels visited during scan accumulate airtime each scan.
I've tested a rebased version of this patch with firmware 20260813 and 
found a few discrepancies:

- the idle counter seems to count slots of about 8 us, not microseconds, 
so busy + idle gives about 1/8 of real time.
- the code always queries band 0. With MLO, the firmware puts the second 
link on band 1, so that link's airtime is missed.

Thanks,

- Felix

