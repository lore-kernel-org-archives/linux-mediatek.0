Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875B7CD5BD1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 18:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HmRVF2hepmyhN/XxqYyryulGn5Er+uqaDbtJWfi0c0=; b=fVknTaNEFpWhW9zS4pgv4FkOg7
	VQqJfsJe0KRRDLkURcP09XRxS4Lbc10R64/JTJWGsy2JqNowSt2xp6LcBUsKaklyuHSpjdqfDbo2A
	PuGZaPW1zpzI+jIfXprtMI3A/NWSIJLQBTTJ9ah6O4Wv7/6qiLt6fREtuP4sSnNU6evupAHnucr+A
	abBXxX1kzB4Mqj5y3yxRFRu4fjHl6looafQmGuqQHgkI5vpIhUGyOSxau8NeBLTi8/HGqrR8noWw7
	YOUAjqkoyy1UIJXxJs13s0yV66j/SecMSu+89O4kwJKUXERpOTewCKGgrtNhrvY9Q3zWSPBCUlB+c
	whJ5IEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7AD-0000000BeKY-1SnW;
	Mon, 01 Jun 2026 18:15:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7AA-0000000BeJT-393k
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 18:15:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-bd8f6ef4ba6so2511757066b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2026 11:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780337696; cv=none;
        d=google.com; s=arc-20240605;
        b=iE/ARDBaaiohCVE2Mp6TZY89Bf/EbbKJWRK1tVNAQreaRY8OzkqTkN+SDuKCx4Y4NP
         8WCZfhyaA1nDJdRLfdkl8oA5XCnfZLAnn9ncJJOGpdmUfQ0P6xBJSu+sXVCl+iwwj6yM
         lbB3kbXjEjiO0W5Rl5UJgAoIXMwp9cTp91ZGQ3u/muce4Bf4ApjU+OB7qHrpRkvWgaBO
         G1ntu+68LwJJfzpeGrXVH6K4MicwW5+iWRs2rvcuNCyZA3Aq/1MV7xU9gEMqKAQ+0rrp
         /e6Hf/IrRd4MyjVluaA9swTXRR90k/nBozYOJkbeqFUTFe0uacLXyLiQ1Xy9I6BCFSs2
         WLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4HmRVF2hepmyhN/XxqYyryulGn5Er+uqaDbtJWfi0c0=;
        fh=Nq6IHEfOMjQL//hfnW4FMLhZhMYeRC2t5vgMXvW/z8Q=;
        b=k9FX4FPqKVRx9jCLIkRdFnidKH1XC1fFn7zrCY2y9hRuWwRGk49qCmFA4j9PW6UV8p
         iBi0AYSH2o94Kqvyg//SFaCM3qnHEb89OzzMHLtNJBF97GLlStDoxRfQpOt0bwDJ+tC+
         fIdphjav0j3cm354oOWfZEqU84JM7BboX1YMOOwYLvY4jhY7KsQNZzlSWZjkSD3Q8tnA
         G9tn5B0WO5+rndTLrFjXiLtfvkUu/TEgrW9Qr/wrU5NfkQ2s2uNxrOm0/yYAmlStJriz
         f5j+hKeP+AiHsaNwW+Nj4IPfEtbeN/JjqulR/IcRho1IMkzphG8kN0+x1uH6zOEon5Qt
         tWbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337696; x=1780942496; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4HmRVF2hepmyhN/XxqYyryulGn5Er+uqaDbtJWfi0c0=;
        b=Fg96a6iHKeO8aKsoYBbe10xbzCjMdaE/behBNC9Iphv1Uh7a+brkrL1Yx99BAu08lQ
         sTkDpjqGjMqcgfVRjy+hgGj1Pr2ZXzG4iAUogsFM1bc/5J80CWPdfQ5A3DmaD1eAb2tX
         aWU1RvM/N+UfbRG9ITciS/u0O2I0FxYZR06K4aU8J76Fi30C98dxKhrJEvFx4Cy2me3r
         /PxsSN2RGW11LRI8FZEJsd/eA9GghLfVpTTexBK1bK44nc0pQK8xXWUvkowgBHiRhEGr
         6qNltHVCGGhUqHY7PxpMhOMcp/3Z9H9O2hBKZkc3XHX7ymCgOZg3HAkRTo+kGsE21xWL
         +yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337696; x=1780942496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HmRVF2hepmyhN/XxqYyryulGn5Er+uqaDbtJWfi0c0=;
        b=KiTdxatPyfRRc+L2LXIzzqovkqZWx/7EvN5sDu2dBW+HjOZBf64SrkinjS8miB9BPM
         9LLzmjg5FqcLGGpff4hlAsznc6/Oq3JC7cDLhgPX/YalZEAEwM7xldCTnDUYnNivPE2G
         YmSvJWSCSN2mD3iuVEjDqwnWJ9Wi3B7zHVzmeW9aJEVyaiYnlT2UkHuc2JmYZcJWAJjI
         QCAspEsWCN0n3qVgs+QN7XVXKCBBtVFtlpFGpZVxzVc53MyTRiGVwF6lo39JtWX7wIe8
         J8Qk8O8nQhe3c9kXA1KJS0S4qKN34icToUNUfUGiugBymlpzaOARGE6OKmru83lfJ8uJ
         3RvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gJs30d/LnTKHMGS3ExVdNtZ0GNPOWiWLUk1Urp4Yb6kM0OueYeVno7myCI8PNXHvTuOS5AiQnzdqK5pgrnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhRdlxR1HdWr5tvOd9Zls49d7G0CpOf+uPS40DH/iaUyXFZBtS
	4h5k+eOUI/w5qK867q3rjQVOBpARoH2cM2gDDK99/PkpqYnJ5J/EevH1K9IHyz4gTe2IucvosV9
	+qutrP1nlO1fwKRrrP5WCDYmW2pTakfsVmdx1
X-Gm-Gg: Acq92OEuFOVRoQA+2Y5cfCXQB420guM2zIAUrpbnW1kmsbOtOTGIxfpHEtWQOzyY5K/
	FBV4BSYI2Zipa5bs0ApBaw5oo7rkS+m7QTh6pMi1ok/vEUq9qVkVyy/S+6idzhq+3skXVlo8rjK
	9MGyAAbrYFu8P2np5NJzgcX0RCTqPCM8rEOjEIJhpOamUD22ELit/cc9vUk10NmuidInT10Ml0f
	c7qAWxer4RSV8yDjCG01C80HHxKwN66UUuqybhM0MWa0ujr4uIzhRjduYqCH1rmIf7J+ytYeoLy
	Ht97zVje9kj2tdY8i2DtNgjcOqoFMbCX+HmK7dqtnqeFD4S3PA==
X-Received: by 2002:a17:907:3e89:b0:bd8:bb13:2227 with SMTP id
 a640c23a62f3a-beab394bd54mr640730366b.6.1780337696213; Mon, 01 Jun 2026
 11:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260531-mt76_tx_status_skb_add-overwrite-fix-v2-1-b73c4b4a9798@kernel.org>
 <ee0e584cb2ad1b536d327eb89342d1646fa96570.camel@mediatek.com>
 <ahwla_obwnwr2cZo@lore-desk> <44c54ed4da0d294c567b3b0ad750f082a6f1be9f.camel@mediatek.com>
 <ahwzwHDF7fT9t7hP@lore-desk> <7f02be7c4f919413718a0218b3792d4b0a222ca3.camel@mediatek.com>
 <ah0fGek5y8Nha0kd@lore-rh-laptop>
In-Reply-To: <ah0fGek5y8Nha0kd@lore-rh-laptop>
From: Roy Luo <roychl666@gmail.com>
Date: Mon, 1 Jun 2026 11:14:44 -0700
X-Gm-Features: AVHnY4K7Rnr9HBZMT68ZgTpm2sqn42gpnxKwQoXBahDuVV30ZAwkIs0p7iRX8VQ
Message-ID: <CAHoxoj+N3AtJgFD8vGP+uDpj6anKMgPBtZGejLDgAz0ZyisSHg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt7996: fix reading zeroed
 info->control.flags after mt76_tx_status_skb_add()
To: "lorenzo@kernel.org" <lorenzo@kernel.org>
Cc: Ryder Lee <Ryder.Lee@mediatek.com>, 
	=?UTF-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>, 
	"nbd@nbd.name" <nbd@nbd.name>, Roy-CH Luo <Roy-CH.Luo@mediatek.com>, 
	=?UTF-8?B?Q2h1aS1oYW8gQ2hpdSAo6YKx5Z6C5rWpKQ==?= <Chui-hao.Chiu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>, 
	=?UTF-8?B?Qm8gSmlhbyAo54Sm5rOiKQ==?= <Bo.Jiao@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_111458_809077_F24B71FD 
X-CRM114-Status: GOOD (  19.15  )
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

> > I mean the link_id is only corresponds to one specific flags bit of
> > mac80211_tx_control_flags. But there are other bits that aren't
> > handled. Wouldn't u32 flags make it more cleaner?
>
> Yes, I got your point, but my concern is if we need to sync link_id between
> mt7996_tx_prepare_skb() and mt7996_mac_write_txwi(). If so, I guess it is
> much better to pass link_id explicitly to mt7996_mac_write_txwi() since it
> does not just depended on mac80211_tx_control_flags and I think we should
> not duplicate the logic in mt7996_mac_write_txwi(). Got my point?
> If in the future (not required now) we need to pass mac80211_tx_control_flags
> to mt7996_mac_write_txwi(), we will do it easily.
>
> Regards,
> Lorenzo
>
> >
> > Ryder
> >
> >

Lorenzo,

I got your point and IIUC the problem being addressed in this patch is that
the link id assignment has unnecessary duplicated logic across different
places. However, the commit tile "fix reading zeroed info->control.flags"
seems a bit misleading to me - this patch does not fully address the problem
where the info->control.flags is cleared by memset in tx path when its
value might still be referenced, the field is still zeroed after
mt76_tx_status_skb_add() and whoever reads it afterward would get
incorrect value. With this patch, we avoid using the incorrect value for
link id, but the root cause remains.

The issue that Ryder tries to address in
https://lore.kernel.org/all/5ecac6a9b7d29526e8438dea105b58f5487c93aa.1778521232.git.ryder.lee@mediatek.com/
concerns the overlapping use of info->control and info->status in tx path,
and it remains valid even with this link id fix applied. We have to be
cautious when dealing with info->control in mt7996 tx path until the issue
is fully resolved.

Regards,
Roy

