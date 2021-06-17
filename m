Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD5DC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 09:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1B49613E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 09:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1B49613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u89LvJGdyXHqirGs49/WWPoJk9OU6vP/Z1n7lPFSFaw=; b=0EbD/TKZiH1lf5
	I4NxAHddq3dGF/yhaAJDC2/e3gsc0sxKEuWz8CI+UkmbvSR9x0THgIYCUKT2JveI6NM20AlsoQJJm
	olwFlXyASNadTf21GVRVRNebtrM38aHU2cqulThwvId2ZufbSCsWAaxdwfwnGRuG4VCONWSgW4gKt
	YgWxLBJHUuQRbIqw2RcMRmSYbDa346VWkjD0R5UX0Z40xALI/ahGO8ymXoKA0ZccwMo7X2tku22Da
	MunQ+l7cAQK4tyyoGln+BIuL3v+PFEjBYyOgMOh8OqF6JMM5Zd5Zyw3zZvEV+Hp5HxbnOOV2u7JAk
	ljCmYn9LbTJk7FfPM93A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltnz3-009amS-Vc; Thu, 17 Jun 2021 09:06:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltnyn-009ajJ-Kw; Thu, 17 Jun 2021 09:06:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D55A3613E9;
 Thu, 17 Jun 2021 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623920788;
 bh=NhgPnttuZxMZXJV+ZeDbAA58wSDZFz54WXGoCVsuvmo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c0tQAMtCVsndLWPbDgqSvmLEYumfCmYAOYh40qnpsvVkwnwO4dHag4jo3+coUfYGg
 gh9VP9Y4540zlQ06DQIz2NJt14ysuCEdLZk1+dVfjxZJ+8b7a9/82HdsoBqKlG6yzd
 9E7+OZwID+grOkYy+ITw65MIHVBVkVkOc55/aWqESPqKNGdtrwxCrhyJOxiX4F8uhM
 A7J9RrqdgsP8xGZ5MbwwiyIOldaKcdpOW4jeKahLj+v/eSsZv8e4UuBOYt3Dtq+R9m
 6ssA2zvPoVEhYIbbXNUACzjso2cBCisHHqSNUOjWj6qmzML3KBS/YBkWEBpJjApP3t
 Xd8/DHm6EPmkg==
Received: by mail-ej1-f46.google.com with SMTP id my49so8575646ejc.7;
 Thu, 17 Jun 2021 02:06:28 -0700 (PDT)
X-Gm-Message-State: AOAM5302GGUCGEB+RXVavLqAbYRdvtvkkrMN4dMXn0y2sut5DGwM69dz
 olszUif0zOxoU5B+ppxAQ3kqBQugU/ASnJiP2w==
X-Google-Smtp-Source: ABdhPJwbKvx5OWeMbwbeoUBrf+TTIITu0s/lazICYsC+cvH8aIDifQ88CpSvYA8kANh6rZgWuu6l9F7+vyUXt2Y1xy4=
X-Received: by 2002:a17:906:ece7:: with SMTP id
 qt7mr4058782ejb.194.1623920787448; 
 Thu, 17 Jun 2021 02:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
 <20210314233323.23377-2-chunkuang.hu@kernel.org>
 <CAAOTY_8ASVD_kApnRmrrsA6nh3XDYAyS-u0g7jK_GF4KipT=wg@mail.gmail.com>
 <CABb+yY21AOrZUzoKaFuiqaEyzXn8t4AxjkOM2_G88mxTpX-_Bg@mail.gmail.com>
In-Reply-To: <CABb+yY21AOrZUzoKaFuiqaEyzXn8t4AxjkOM2_G88mxTpX-_Bg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 17 Jun 2021 17:06:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY__eEUdpdQ4a8pK0HPUgbYQEaxBEWASTwkwUCMTuEyQW4Q@mail.gmail.com>
Message-ID: <CAAOTY__eEUdpdQ4a8pK0HPUgbYQEaxBEWASTwkwUCMTuEyQW4Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] mailbox: mtk-cmdq: Remove cmdq_cb_status
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_020629_724924_80E9BB9F 
X-CRM114-Status: GOOD (  13.35  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEphc3NpOgoKSmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPiDmlrwgMjAy
MeW5tDXmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IOTo1NeWvq+mBk++8mgo+Cj4gT24gV2VkLCBNYXkg
MTksIDIwMjEgYXQgNjoyMSBBTSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPgo+ID4gSGksIEphc3NpOgo+ID4KPiA+IENodW4tS3VhbmcgSHUgPGNodW5r
dWFuZy5odUBrZXJuZWwub3JnPiDmlrwgMjAyMeW5tDPmnIgxNeaXpSDpgLHkuIAg5LiK5Y2INzoz
M+Wvq+mBk++8mgo+ID4gPgo+ID4gPiBjbWRxX2NiX3N0YXR1cyBpcyBhbiBlcnJvciBzdGF0dXMu
IFVzZSB0aGUgc3RhbmRhcmQgZXJyb3IgbnVtYmVyCj4gPiA+IGluc3RlYWQgb2YgY21kcV9jYl9z
dGF0dXMgdG8gcHJldmVudCBzdGF0dXMgZHVwbGljYXRpb24uCj4gPgo+ID4gSG93IGRvIHlvdSB0
aGluayBhYm91dCB0aGlzIHNlcmllcz8KPiA+Cj4gSG1tLCBJIGNhbid0IHJlbWVtYmVyIHRoZSBy
ZWFzb24gSSBkaWRuJ3QgcGljay4gQnV0IGl0IHdhcyBkZWZpbml0ZWx5Cj4gdW5kZXIgInRvZG8i
IGxhYmVsLiBJIHdpbGwgcGljayBpdC4KPiBCVFcsIGl0IGhlbHBzIHRvIHNlZSBBY2tlZC1ieSdz
IGZyb20gc29tZW9uZSB3b3JraW5nIGZvciB0aGUgaC93IHZlbmRvci4KCllvbmdxaWFuZyBpcyB3
b3JraW5nIGZvciB0aGUgaC93IHZlbmRvciBhbmQgaGF2ZSByZXZpZXdlZCB0aGlzIHNlcmllcywK
ZG9lcyB0aGlzIGdldCBhbnkgaGVscD8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gdGhhbmtz
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
