Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8193CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlhpKBvggfubOXVLA2lXK9ykIxGOcFqmwZMsH+zgmew=; b=pVWnJvinmmrBiBXSa0WzdhfSER
	3F2uaoUZalHc5GyExAanZsHxW+MHwpxymome/bRiWANC7tKFdfO55K90Rh9N1hi1bMsEBrCK7DSF0
	ZKSmmzdXNOkleHy3CFm0jnkZNaqTO+6W263rd+qVn1NvaQSf5LkxUdjDO3V4fXrK4gcM9AeoCI7Wy
	zL38lwCJVTyVWWWY5T2+62Ir5Gn1oPi32XdSJT+akMQNh3t8IU/apVd66kTQnWZzGlY6V7g92kKG1
	QF3/mNRQ1cQF8Hgci9RoEHO7g1BgG90IX42Q8X3uF+E2HynTa5eTrcc7QgZhepColYBB7cq9M03Zx
	r9yqx1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllWK-00000003S0U-1Vr4;
	Wed, 04 Sep 2024 08:37:44 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllN8-00000003P4d-43d0
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Sep 2024 08:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JlhpKBvggfubOXVLA2lXK9ykIxGOcFqmwZMsH+zgmew=;
	t=1725438494; x=1726648094; b=SCRAGIL8g4z+BhwY+TVdqYc5iw74o7eGjl96LkfmdV9Kf2r
	fo/j2cz/v9jYtUxw+WKlmgFrkjOO473CILiTf9hM7jNqQqo74SrS5tUdp4KwlIg4VJkWaQ2AXNIyR
	ONPq9+xpKQBk4EPOPkaMoEpmZOXQE9sRQa5dPh+uz4fvX90UyBIbUUYmkRnYqD9BzBFm822R58RZ+
	U/Ug0kPrcevhylRpD4bCd8H66DSTzWrrHA77YSTVyMDjyPst+OKai+IGCL4cmQfIJIN9JUPi1jtFi
	LN2Xd8JtYrWiorr5CUPOjSs4n6CyRexTxjJYjPdEPrnNuecb5rZQiRyFqqO5Avag==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sllN3-00000004TqR-3XWe;
	Wed, 04 Sep 2024 10:28:10 +0200
Message-ID: <be8d3a5a20a2c77490d78ca05e6ece7651c57caa.camel@sipsolutions.net>
Subject: Re: [PATCH v3] wifi: mac80211: introduce EHT rate support in AQL
 airtime
From: Johannes Berg <johannes@sipsolutions.net>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, jonas.gorski@gmail.com
Cc: deren.wu@mediatek.com, Sean.Wang@mediatek.com, Soul.Huang@mediatek.com, 
 Leon.Yen@mediatek.com, Michael.Lo@mediatek.com, Eric-SY.Chang@mediatek.com,
  km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com, 
 posh.sun@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, 
 Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>
Date: Wed, 04 Sep 2024 10:28:08 +0200
In-Reply-To: <20240904082109.4339-1-mingyen.hsieh@mediatek.com>
References: <20240904082109.4339-1-mingyen.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_012815_042136_60D24DD6 
X-CRM114-Status: UNSURE (   5.32  )
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

On Wed, 2024-09-04 at 16:21 +0800, Mingyen Hsieh wrote:
>=20
> +#define IEEE80211_EHT_MAX_STREAMS	16

Still not sure why you think 16 streams are legal in EHT?

johannes


