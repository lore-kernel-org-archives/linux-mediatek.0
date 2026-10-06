Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8796CCA5FFF
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9huabkVuiEVa9+YJyxDZZulkE2ksEl+ebzBkLNAGbI=; b=f7Yq/YKZjeBR2uju0Rh9yCNxnO
	Nas4EpW5bq9tqr1bP8RB1pbjEKyrHSRLlJlL0x0YKCxRUApYlO/CAEMIaz3hSLzmSbp5in5rPW78b
	pnWi2VsvlY1gkxrOPUw2zxCnR+aez5k88fydAPvhtGWl2tTDY7XFO7ST9tc7INQ9/XM9xuARO5XMS
	5WLL1ZippDYu3H+KQzJJ5j+nOGJQuVHJgpBt2aSXwFwI55WOMhqgESST083CJnp3BD+R/P9epIWms
	sJyBeep0RrGC7RDpkdBQcqEmjPwOK/TEt8IBdEL/6GI8VODqWR4xBMg74EHsMv8LUZngtQBDU4ce/
	v1sYccZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1Lo-00000000Mls-24i2;
	Tue, 06 Oct 2026 09:20:44 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1Lj-00000000Ml5-0mJY
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 09:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o9huabkVuiEVa9+YJyxDZZulkE2ksEl+ebzBkLNAGbI=; b=ZU/x8VxcKOrc0/twjlSLtL0lwW
	V4fv2L2SwbzL6Gd6oR8Vs8Hl2sf3fUCPsUELOoGY8UAnXSr96sobsOHB2xgAyw43j+IdjbNL+xoqZ
	gJBNbZ8/CaDGcJHoEc977qX8wCeFAOP61FwuT4WtuK0tbPpzs8UQJ64dEkeWwbxxS5oc=;
Received: from p54a434bb.dip0.t-ipconnect.de ([84.164.52.187] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xE1Le-00GqJM-02;
	Tue, 06 Oct 2026 11:20:34 +0200
Message-ID: <0424acc3-9545-4d6c-8171-ab8b33d20638@nbd.name>
Date: Tue, 6 Oct 2026 11:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/23] wifi: mt76: mt7925: add NDC-aware TX GTK table for
 NAN_DATA
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 yu-ching.liu@mediatek.com, jenhao.yang@mediatek.com, posh.sun@mediatek.com,
 Chengwei Yu <chengwei.yu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
References: <20260927210306.737669-1-sean.wang@kernel.org>
 <20260927210306.737669-9-sean.wang@kernel.org>
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
In-Reply-To: <20260927210306.737669-9-sean.wang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_022039_338249_5D98B5BB 
X-CRM114-Status: UNSURE (   9.70  )
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

On 27.09.26 23:02, Sean Wang wrote:
> From: Chengwei Yu <chengwei.yu@mediatek.com>
> 
> NAN TX GTK is NDC-scoped: every station in the same NAN Data Cluster
> shares one key, and a single NAN_DATA vif can join multiple NDCs
> concurrently. Add mt792x_nan.nan_tx_gtk_table[] (up to
> MT792X_MAX_NAN_NDC = 8 RCU on-demand entries, one per NDC) and route
> interface-directed NAN_DATA multicast through the matching WTBL in
> mt792x_tx(), falling back to the interface WTBL when no entry exists.
> 
> Teardown lives in mt7925_remove_interface(), not the shared
> mt792x_remove_interface(): NAN_DATA vifs are mt7925-only so cleanup
> in the shared path would never run.
> 
> NOTE: NDC selection from skb context is not yet implemented; the
> lookup always picks the first installed entry until mt7925_nan_set_key()
> populates the table.
> 
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
I don't see anything in the code that fills nan_tx_gtk_table.
Am I missing something here?

Thanks,

- Felix

