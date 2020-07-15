Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E32C433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 23:47:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BECF206F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 23:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZNYf/7Rn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYZW967h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BECF206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b0QZoIXcRIflQtc8CnUGphefkyby4vBS4VIXDVJc+r8=; b=ZNYf/7Rn7KrUQk8bhVLmpuNc2
	zaTEWSe/doG0qOiS0AsLnL8tEIcNKXp90GrArBXEJIKJd8eLzRyx9OcUsZmM5A7HK9HR87zdUe/zR
	fKPMGBXjANSe03gerfIVi2LVk9gJobN2MVUSbPVSSVn3vHVeNke0c+I6DeCKgbmLDXbtTOHiaZfOp
	LibW89W/9uEHC0nOsxcHIbF4JzhmUbSFuOMMGJLJ2w+fAI1s+9S7HGs0vRcUJtro44GmzPqtR53Ve
	6CqIADxWvz+kKAvYLbloTZfS/2uC5RDB++hrGwcJT5QtVdQbtrrnfzrBxH2Jm76S44RSZbjMAMZWe
	wLqBLEQBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvr74-00087K-Hx; Wed, 15 Jul 2020 23:46:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvr70-00086T-Ax; Wed, 15 Jul 2020 23:46:55 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE9DF20775;
 Wed, 15 Jul 2020 23:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594856812;
 bh=0Z67DEQDHtPE1jpEjdWwnW7bGURvhC5c7yF3Sjpr8hk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cYZW967hw78HF44rBPZbhDp74+Fd+k9NG8yQo6a39ZFC/RrcnhJ6l1FplyjoUsLrm
 FQsevYclY00Fz2eqEoFv+K3SCB82olAXFZcdd4hjHkAP04Pzv0CBfGSUBl69T9+uwx
 QCWEh/HsT2CBwvEiB8OsGm01nw7B6frzsh/OrI6w=
Received: by mail-ej1-f51.google.com with SMTP id w6so4323078ejq.6;
 Wed, 15 Jul 2020 16:46:51 -0700 (PDT)
X-Gm-Message-State: AOAM532hZ8FEr76AJ0koXsIfM1j3Sgz8G6OR88AmDTJOgoZVBrkeNkPz
 R3xqjJNouZ/9oManbd5jTEi3mkmJsiJS7stCrA==
X-Google-Smtp-Source: ABdhPJybFTPB4ttZSVsoT9XP7GbTBiZv3OHdAp22XXJXjOEHZph4uhAj/ulMlTNJr2ITr8vkAIq1+BAKIAJ+CF4iAB0=
X-Received: by 2002:a17:906:404e:: with SMTP id
 y14mr1294495ejj.260.1594856810429; 
 Wed, 15 Jul 2020 16:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
 <1594285927-1840-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1594285927-1840-3-git-send-email-neal.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 16 Jul 2020 07:46:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-6d12FUf5XnYco0f0CfeWsb-XjsCESsLixLr_Q=jnc0Q@mail.gmail.com>
Message-ID: <CAAOTY_-6d12FUf5XnYco0f0CfeWsb-XjsCESsLixLr_Q=jnc0Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_194654_499633_573950F2 
X-CRM114-Status: GOOD (  15.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SEksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIg55pelIOmAseWbmyDkuIvljYg1OjEz5a+r6YGT77yaCj4KPiBNZWRpYVRlayBidXMgZmFicmlj
IHByb3ZpZGVzIFRydXN0Wm9uZSBzZWN1cml0eSBzdXBwb3J0IGFuZCBkYXRhCj4gcHJvdGVjdGlv
biB0byBwcmV2ZW50IHNsYXZlcyBmcm9tIGJlaW5nIGFjY2Vzc2VkIGJ5IHVuZXhwZWN0ZWQKPiBt
YXN0ZXJzLgo+IFRoZSBzZWN1cml0eSB2aW9sYXRpb24gaXMgbG9nZ2VkIGFuZCBzZW50IHRvIHRo
ZSBwcm9jZXNzb3IgZm9yCj4gZnVydGhlciBhbmFseXNpcyBvciBjb3VudGVybWVhc3VyZXMuCj4K
PiBBbnkgb2NjdXJyZW5jZSBvZiBzZWN1cml0eSB2aW9sYXRpb24gd291bGQgcmFpc2UgYW4gaW50
ZXJydXB0LCBhbmQKPiBpdCB3aWxsIGJlIGhhbmRsZWQgYnkgbXRrLWRldmFwYyBkcml2ZXIuIFRo
ZSB2aW9sYXRpb24KPiBpbmZvcm1hdGlvbiBpcyBwcmludGVkIGluIG9yZGVyIHRvIGZpbmQgdGhl
IG11cmRlcmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmVhbCBMaXUgPG5lYWwubGl1QG1lZGlhdGVr
LmNvbT4KPiAtLS0KCltzbmlwXQoKPiArCj4gKy8qCj4gKyAqIG10a19kZXZhcGNfZHVtcF92aW9f
ZGJnIC0gc2hpZnQgJiBkdW1wIHRoZSB2aW9sYXRpb24gZGVidWcgaW5mb3JtYXRpb24uCj4gKyAq
Lwo+ICtzdGF0aWMgYm9vbCBtdGtfZGV2YXBjX2R1bXBfdmlvX2RiZyhzdHJ1Y3QgbXRrX2RldmFw
Y19jb250ZXh0ICpkZXZhcGNfY3R4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCBzbGF2ZV90eXBlLCBpbnQgKnZpb19pZHgpCj4gK3sKPiArICAgICAgIGNvbnN0IHN0
cnVjdCBtdGtfZGV2aWNlX2luZm8gKipkZXZpY2VfaW5mbzsKPiArICAgICAgIHUzMiBzaGlmdF9i
aXQ7Cj4gKyAgICAgICBpbnQgaTsKPiArCj4gKyAgICAgICBkZXZpY2VfaW5mbyA9IGRldmFwY19j
dHgtPmRldmljZV9pbmZvOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBnZXRfdmlvX3Ns
YXZlX251bShzbGF2ZV90eXBlKTsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgICp2aW9faWR4ID0g
ZGV2aWNlX2luZm9bc2xhdmVfdHlwZV1baV0udmlvX2luZGV4Owo+ICsKPiArICAgICAgICAgICAg
ICAgaWYgKGNoZWNrX3Zpb19tYXNrKGRldmFwY19jdHgsIHNsYXZlX3R5cGUsICp2aW9faWR4KSkK
PiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKCkkgZ3Vlc3MgaWYgb25lIHZpb19p
ZHggaXMgbWFza2VkLCBpdHMgc3RhdHVzIHdvdWxkIG5ldmVyIGJlIHRydWUuIElmCm15IGd1ZXNz
IGlzIHJpZ2h0LCBJIHRoaW5rIHlvdSBjb3VsZCBza2lwIGNoZWNrX3Zpb19tYXNrKCkgYW5kCmRp
cmVjdGx5IGNoZWNrX3Zpb19zdGF0dXMoKS4KCj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoIWNo
ZWNrX3Zpb19zdGF0dXMoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwgKnZpb19pZHgpKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgc2hpZnRf
Yml0ID0gZ2V0X3NoaWZ0X2dyb3VwKGRldmFwY19jdHgsIHNsYXZlX3R5cGUsICp2aW9faWR4KTsK
PiArCj4gKyAgICAgICAgICAgICAgIGlmICghc3luY192aW9fZGJnKGRldmFwY19jdHgsIHNsYXZl
X3R5cGUsIHNoaWZ0X2JpdCkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
Kwo+ICsgICAgICAgICAgICAgICBkZXZhcGNfZXh0cmFjdF92aW9fZGJnKGRldmFwY19jdHgsIHNs
YXZlX3R5cGUpOwo+ICsKPiArICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7CgpJIHRoaW5rIG11
bHRpcGxlIHZpb19pZHggd291bGQgdmlvbGF0ZSBhdCB0aGUgc2FtZSB0aW1lLCB3aHkganVzdCBw
cm9jZXNzIG9uZT8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsgICAgICAgfQo+ICsKPiArICAg
ICAgIHJldHVybiBmYWxzZTsKPiArfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
