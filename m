Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D07EC7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 19:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEyqjHMyCbWyM5ZcASzwV+iWuK2dihwzu7liHKG9hHs=; b=XJRcYIwUI1Q4riSjg8uapDpNPA
	i+Ucjm708NgoNUtnnvNnQuQ3VzqaAejMrzq+52xAGsk4a5GAMVtEuWRyhyaVwoF1p6YegK/sbpyWz
	Wa1aBwvL//R22VO92U686aAx+txik2xckrhVCZCqhrrCmqe133J7CDziAVeKejH4ukTSerqOAquUw
	QQ0zZV/5WTgAZBDHbxogMjgrOhOzYEEXlUtCJmWBdmjIOedbElfoUjDA52fKHc9l7pJJIUYhhNdbS
	UO/hxP6BWVUf459k8ae1IjdN2qQQwbpyaKM9ng/DA+H+xaV8QRFhRUbqINcGhCJOFBVVyDGc/Jjut
	BV/KP2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peL9G-00AGr2-1p;
	Mon, 20 Mar 2023 19:26:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peL9C-00AGpO-0c;
	Mon, 20 Mar 2023 19:26:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E0FF617B6;
	Mon, 20 Mar 2023 19:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3712C4339E;
	Mon, 20 Mar 2023 19:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679340380;
	bh=p3nfI37uSD2HaSJ85GLFWgl7AfpzPINmlDeM97COr3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSbRdbY4kd9P9uxj3pLqomRsxEQw1KI3sfqU0vaasQo9/aJGViFhNiqlTlb9eHYa5
	 vubwALccOL5I2YMNuYB7Lb14Lq6C6B0aId2DQd5MdfuzSwEjkX5UzU+fqajqUeKcZ3
	 uGGNojiVjiXlAE7nE9ejACNKX4zYxJI+ongZew5BJfrglx6gIuhdlm9cuSdxlkmNiZ
	 hWlH5higqWB6ImYOJ3SA/TgQ7Um8r3fOTd5RHpHBnuiUyUCtQvLZwQj9SJZ9BGq0hi
	 atVLKDonKz2bJunCnZjifinF8cuYuUUQN74EZ4X48UrWrgP95n8keaRzwGnFMdwT+r
	 NUUBaQk/smCrQ==
Date: Mon, 20 Mar 2023 13:26:49 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Simon Horman <simon.horman@corigine.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] wifi: mt76: mt7921: Replace fake flex-arrays with
 flexible-array members
Message-ID: <ZBizeZ5DaBT5KKXN@work>
References: <ZBTUB/kJYQxq/6Cj@work>
 <ZBh0NhaNFnttWRz8@corigine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBh0NhaNFnttWRz8@corigine.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_122622_271879_B43D9987 
X-CRM114-Status: GOOD (  10.49  )
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

On Mon, Mar 20, 2023 at 03:56:54PM +0100, Simon Horman wrote:
> >  struct mt7921_asar_cl {
> > @@ -85,7 +85,7 @@ struct mt7921_asar_fg {
> >  	u8 rsvd;
> >  	u8 nr_flag;
> >  	u8 rsvd1;
> > -	u8 flag[0];
> > +	u8 flag[];
> 
> I am curious to know why DECLARE_FLEX_ARRAY isn't used here.

In contrast to the other structs, there is no object of type struct
mt7921_asar_fg declared in a union:

 91 struct mt7921_acpi_sar {
 92         u8 ver;
 93         union {
 94                 struct mt7921_asar_dyn *dyn;
 95                 struct mt7921_asar_dyn_v2 *dyn_v2;
 96         };
 97         union {
 98                 struct mt7921_asar_geo *geo;
 99                 struct mt7921_asar_geo_v2 *geo_v2;
100         };
101         struct mt7921_asar_cl *countrylist;
102         struct mt7921_asar_fg *fg;
103 };

The DECLARE_FLEX_ARRAY() helper was created to declare flex-array members
in unions or alone in structs[1].

--
Gustavo

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays


