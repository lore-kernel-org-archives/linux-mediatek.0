Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58162C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 20:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+ztdVDBMdyEPc5K/Syi6vft/YfjlrPz5qvJK9N31xw=; b=galbAA1ABLr+6P
	/BeVtMOLiAeAzzxO3/mB72oauROEO3/ePmq+e8iuP08KRNfq1kh+IFARKNCqPY1h2bwCShjUQwBGy
	zPYNj79H0y3+nSLQUSH7Hb12/q/KhwdjEUVJkyoKT/y0aW3TovFqc+mniHCRtBP861TV3UW3+EImf
	KZlHgW0SNl/dDAZyxmWqlytvPkULfuebgaMnmffuIYxB5lT1D3f/TI2YmeUuttbWP7sf12pn5gE8x
	VjN5BaIWhk+w/apn2pSI/uCtEcf8rTcElIC4mzwvOSPaekTN6luC2rTyAK8qOkrVHvHLTEpJvpTX8
	cmOw9/X+QZJgZ3Xdbj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxaYu-002XKz-9P; Wed, 15 Dec 2021 20:07:40 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxaYh-002XGu-1C; Wed, 15 Dec 2021 20:07:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id k9so22362913wrd.2;
 Wed, 15 Dec 2021 12:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oTn6F/PIAxnH+UUMVbLCa+GN5bx695vAjTKoG7Ye+2E=;
 b=oMuBZtHIiqvQNXpXdmtvUQ8UMMr78otbfRGC/T5p0ykoai8NoJvMeesDuQc1wf9TGM
 OI70nVBFLs6kAfBpxH9pWTGppzcvJ4UgdWM9KZCJQpkmUm0VGcQ2y8EPpVPZEwKqnWgh
 09YCCrzEtBR84kMRniJJx5mP4rXXgniLElS8TfWB5btaZCZhs5wVu5FZIAAUnchXtv1z
 x1q9RX68uZTDVZvsiDOFoSkrBSzFL/7h9liRMgbWlUV2g2JkTF1FSgSn7mYXHyReXbNU
 hEp6S7iijVxWJDk8i61HnEaKmrDYqYNUKnC03LenwpRs03105N0fCLj7OkRxIeWemdEO
 BvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oTn6F/PIAxnH+UUMVbLCa+GN5bx695vAjTKoG7Ye+2E=;
 b=SmaNy7EnEXdVL4mluYEz++RVrjW6p1iQd+431MKLMwSYNE+yRq9q408T5BmnZgTApt
 o3Jt9ARO/5KQSIAX9juamDP4fJjKTM7ZaWK1Rh4sjfxS3BWnCfJPImtQFmH/itbmWnG0
 sOmeXF2vdQ9U5f/6lJ/jaDrxvTxZ0qEVP4yuAPc9eAzp6laXgYMMTah/6JHcfmavTQI+
 7neoiyX/Eexnk8r1ZUK6cVVXQXyl1Uz1+S2C+NavLZic3MkvYmQ/33xw0kZHiAw3knDa
 w/ADuiEl2fiW2+DyCRUjjePVnm8kc5uGkNtMyWwY+bQOQcu2DJe7mgv9SLO8XlIY/8pS
 hAIQ==
X-Gm-Message-State: AOAM530/VjPdJcNBvbRbPlCF+byaqT/Kice289SOTNZYehVXx9gQ2xZp
 rWxqU+84TyvptBPR9mhAsB6GbSTzx6E=
X-Google-Smtp-Source: ABdhPJwVi4hkIGkh1pKRl5zQ8zACxwyQBSVxBuqIW0mpYf3U1qDV8ItlCRvWYLk6zKoTd5G//sk0qg==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr6084386wry.279.1639598843675; 
 Wed, 15 Dec 2021 12:07:23 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id q14sm72140wro.58.2021.12.15.12.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 12:07:23 -0800 (PST)
Message-ID: <48fe0cfc-9bad-f20d-9b02-05ce3987e56d@gmail.com>
Date: Wed, 15 Dec 2021 21:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 0/2] Mediatek MT7986 pinctrl support
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20211122123552.8218-1-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211122123552.8218-1-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_120727_099010_2C41B24C 
X-CRM114-Status: GOOD (  16.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAyMi8xMS8yMDIxIDEzOjM1LCBTYW0gU2hpaCB3cm90ZToKPiBUaGlzIHBhdGNoIHNlcmll
cyBhZGQgcGluY3RybCBzdXBwb3J0IGZvciBtZWRpYXRlayBtdDc5ODYgU29DIHNlcmllcy4KPiBJ
dCBpcyBiYXNlZCBvbiBwYXRjaCBzZXJpZXMgIkFkZCBiYXNpYyBTb0Mgc3VwcG9ydCBmb3IgbWVk
aWF0ZWsgbXQ3OTg2Igo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMTEyMjEyMzIy
Mi44MDE2LTEtc2FtLnNoaWhAbWVkaWF0ZWsuY29tLwo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVzIGJh
c2Ugb24gdGhlIGZvbGxvd2luZyBwYXRjaGVzCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjExMDIyMTI0MDM2LjUyOTEtMi1zYW0uc2hpaEBtZWRpYXRlay5jb20vCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjExMDIyMTI0MDM2LjUyOTEtMy1zYW0uc2hpaEBtZWRpYXRl
ay5jb20vCj4gdGhhdCBoYXZlIGJlZW4gYXBwbGllZCB0byB0aGUgcGluIGNvbnRyb2wgdHJlZQo+
IAoKV2hvbGUgc2VyaWVzIGFwcGxpZWQgdG8gdjUuMTYtbmV4dC9kdHM2NAoKVGhhbmtzIQoKPiAt
LS0KPiB2MTA6IHVzZWQgbXQ3OTg2Yi5kdHNpIHRvIGluY2x1ZGUgbXQ3OTg2YS5kdHNpIHRvIHJl
ZHVjZSBkdXBsaWNhdGUgZHRzIG5vZGVzCj4gdjk6IGFkZGVkIEFja2VkLWJ5IGFuZCBSZXZpZXdl
ZC1ieSB0YWcKPiB2ODogZml4ZWQgdWFydCBub2RlIGluIHlhbWwgZHRzIGV4YW1wbGUKPiB2Nzog
c2VwYXJhdGUgcGluY3RybCBwYXJ0IGludG8gYSBzaW5nbGUgcGF0Y2ggc2VyaWVzCj4gCj4gQWNj
b3JkaW5nIHRvIHRoZSBtYWludGFpbmVy4oCZcyBzdWdnZXN0aW9uLCB0aGlzIHBhdGNoIHNwbGl0
cyB0aGUgcHJldmlvdXMKPiB0aHJlYWQgaW50byBpbmRlcGVuZGVudCBwYXRjaCBzZXJpZXMuCj4g
VGhpcyBwYXRjaCBpbmNsdWRlIGNsb2NrIGRyaXZlciBhbmQgZGV2aWNlIHRyZWUgdXBkYXRlCj4g
Cj4gT3JpZ2luYWwgdGhyZWFkOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDkx
NDA4NTEzNy4zMTc2MS0xLXNhbS5zaGloQG1lZGlhdGVrLmNvbS8KPiAtLS0KPiAKPiBTYW0gU2hp
aCAoMik6Cj4gICAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFkZCBwaW5jdHJsIHN1cHBvcnQgZm9y
IG10Nzk4NmEKPiAgICBhcm02NDogZHRzOiBtZWRpYXRlazogYWRkIHBpbmN0cmwgc3VwcG9ydCBm
b3IgbXQ3OTg2Ygo+IAo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9NYWtlZmlsZSAg
ICAgICAgfCAgMSArCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmEtcmZi
LmR0cyB8IDIwICsrKysrKysrKysrKysrCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210Nzk4NmEuZHRzaSAgICB8IDIxICsrKysrKysrKysrKysrCj4gICBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210Nzk4NmItcmZiLmR0cyB8IDI5ICsrKysrKysrKysrKysrKysrKysrCj4g
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmIuZHRzaSAgICB8IDEyICsrKysr
KysrCj4gICA1IGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmItcmZiLmR0cwo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2Yi5k
dHNpCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
