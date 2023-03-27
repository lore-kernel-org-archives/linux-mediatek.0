Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165DAC7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJpWt9s21SkDzN868Ycl9scKYBZabhvtSuX4N4znx2I=; b=cB7j0ien7Q9GYEdJ/tJ4Hxihig
	YY065jD3S/cycBjMgWJg9COsSMj1sED/PWvmTQhz9j8xLVfO8E+Cjk26mwcViN4qURlUae1IecJ+Q
	pMgd3LWuqZ2utMQqJb+JV9E147N0bLYBZoAowx3eOdLJcklsK/cAhV4ax5u7IrP6mvHphpWscs+jq
	m4Ha2C750yMdIgE6DlYYSgTPdp2pd8rahOwtJuKdrnvqmcTrj4CzzV4KmVOCbx+aEe/sw8ftmKCUn
	Gg7hSAf+NFOxzQ+0z3IrFVJVq8R9SGtYT3/Pc04zfJYLpeOX3Hw8WelYCedI1IeLWa3ljRCXg035b
	dkh5LBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkOU-00Ag1J-1E;
	Mon, 27 Mar 2023 10:48:06 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkOS-00Ag0e-1v
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Mar 2023 10:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JJpWt9s21SkDzN868Ycl9scKYBZabhvtSuX4N4znx2I=; b=idn/xQ8Tep2xKzfY9XGvXOygkX
	W/SF2/UmHZOvnurQK09hDdpGrIEcrmgAxQjh4bNL1nVrm15g3NwCKZvkoHGRiYXObHIrKNi94T1g+
	LW5K92tB4qafZxRWPCM72gwmkgBKyAy+eVXvTST9xABzeTenVozQLPayktwJRcCm5qIM=;
Received: from p54ae9730.dip0.t-ipconnect.de ([84.174.151.48] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pgkOH-007LUO-7z; Mon, 27 Mar 2023 12:47:53 +0200
Message-ID: <1da4680e-d7b9-dc17-0bff-3edfa046a357@nbd.name>
Date: Mon, 27 Mar 2023 12:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] wifi: mac80211: enable EHT mesh support
Content-Language: en-US
To: Ryder Lee <ryder.lee@mediatek.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <6088d99492ce29f1075b3a22b2c2e5d010196e51.1679891359.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <6088d99492ce29f1075b3a22b2c2e5d010196e51.1679891359.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_034804_725400_72AEE0ED 
X-CRM114-Status: UNSURE (   4.94  )
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

On 27.03.23 06:37, Ryder Lee wrote:
> @@ -4903,7 +4974,7 @@ u8 ieee80211_ie_len_eht_cap(struct ieee80211_sub_if_data *sdata, u8 iftype)
>   				       &eht_cap->eht_cap_elem,
>   				       is_ap);
>   	return 2 + 1 +
> -	       sizeof(he_cap->he_cap_elem) + n +
> +	       sizeof(eht_cap->eht_cap_elem) + n +
>   	       ieee80211_eht_ppe_size(eht_cap->eht_ppe_thres[0],
>   				      eht_cap->eht_cap_elem.phy_cap_info);
>   	return 0;
This looks like it should be a separate fix, right?

- Felix

