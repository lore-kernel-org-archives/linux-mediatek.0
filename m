Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7898AE8FDD0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Dec 2025 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ifUC8vCZeQOBq15C7xGgJzh5lsXNM+HByA9WfzvVCGY=; b=XYzpfQeez3cQ2ULt1kFXrU2cIl
	xXD5lNUKCWcgyeC1Pri13BHokn/u4lUI3BjPVDp99YWakh6lsdfoJc1Ijdk9IcTBAoy+ScC+Nw7aI
	EzTNPRXgNSPAcY8SVUUehQZxgFE1gmlN3c0KplF5sY0qXh4nPHyaBnMZAEYa7pItniHYnstZ/z508
	49+eaBk7Vg0IbEtN48RYj33T3wQFiXwNNv0LDKCC86lZXPIhMjWYJRHxZpUobpvPB6MJTuPc6srEj
	LbimayVgcOK6pnjEVJC4JIm2xKofJeqFb5uWumyojIDBwkG0dl/+XEvdMCIy+twgUMqd39w7R7Wr7
	VYXDnszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZQGu-00000001okz-278O;
	Sat, 27 Dec 2025 09:07:36 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZQGr-00000001okH-2IjK
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Dec 2025 09:07:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7f651586be1so3653646b3a.1
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Dec 2025 01:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1766826452; x=1767431252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifUC8vCZeQOBq15C7xGgJzh5lsXNM+HByA9WfzvVCGY=;
        b=J42wcZjfxt1cLLPNRykgER43gCV3M7rrSnliq9fVOT724hgjoJ/4H5zp66WNPweEsI
         kbc3S4wax1DvHx65MHM9ZgsT7FpulSqKMfmSA1Y1T518Bd7/0pUcfK5e1mPUGcGGNzws
         bAEHaWTd1NMvyVRKgQ7csC62DvrXMOFQGusVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766826452; x=1767431252;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ifUC8vCZeQOBq15C7xGgJzh5lsXNM+HByA9WfzvVCGY=;
        b=HK/go4rbfrRz2QwwPzG4u+0WviUN66O6wEJazmb1CCXSzWsab7PRoUkUVasOnPUM3J
         fROJy14LAtr/4d0aaHvjG7HnDlyEAvDxK6lXU18uYaNjn33+Jd3qWZRbq5EE4lQcNoox
         EmZM2RMuCpKMJ0tul1sAeBrGb6Bk5kLNfItPdFiEVBOiR2wjnXmoKgcsTWqDi7mOXAmm
         wodDs7CC0R5kieAavfwSlBDAJn7hwhWwSsytQlEbIhQekGde7t5J5E3pnC2PiyG0Wuzt
         XxRJHIJZ3WuyVzUlM80HS1+4O+x06ND26o4l5MnAAe6q09xQ97CoAEkzJQKzFT6ia8mb
         OxFg==
X-Forwarded-Encrypted: i=1; AJvYcCXpDX+glpHmaTGNDORr6CqJcApJ/JFQBYACTtdFYGFjthw/fBi9vPzgkK0XmhZI+QA4QJ0tGNYrejEioxp+Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOYg2ZBBu7PNPcnuWSCVtNhMl3QGudj9/hWNC09tBVtIyNlDQM
	jDxLhjPW8c5sSlIx9+dt3GQZxV3xvIm/hxkK4phgsQqQ9ljFH++R+Bii0z6V/SdceE8=
X-Gm-Gg: AY/fxX68ssUXaMvr0ANmZmNef2gtLgdxIG3LxfBt7K3rvo1rVBU7RhaMkDNUCcjvVD7
	V/I3ynFenobcSwbrQt6VwhPzs5841X9l3oEyK3PsE5wB6WaKJh5rRJb3EfJEkXMfIwvfD6Lsbii
	94s4lqs0xsd0wYiXgwl9t63u76yAimpA1ZtPELG8tuPcrOPp2Ic5ITCujSHgcXg4m3anrde6rO7
	YWshhS1/uh4SOi8USj9p5Ndfiim36+vt8ZBsjzAUek3PcSWjQpxPdidLu1eyWjxQb8C8YWYUwXZ
	ix25OMQfriUqogqlLaTwDaiG7ihJkyctqu7Z7rL7XCMEbZcVmzevUk1aAmqZlvFe/ebL+hnYPR5
	EJuZXw4fvxOMxksdeR/qIpNab3wjHLa7n1yay4rzZEHE9F7/RPEm4k0dbl1PGsp+aYcyjh/ZonG
	MapoiEGwQWfXkOHQpjVqrlbYdi
X-Google-Smtp-Source: AGHT+IHFE6P6W0KNJpo0Rcyj79nO8yWZp/ADp0FPoeOXmnhH0hpzYXHfdC+BhTP+JpyW7wtzFaLnQA==
X-Received: by 2002:aa7:868f:0:b0:7f0:61d:d092 with SMTP id d2e1a72fcca58-7fe0d7a28a8mr22142128b3a.21.1766826451847;
        Sat, 27 Dec 2025 01:07:31 -0800 (PST)
Received: from [192.168.88.64] ([182.54.168.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a939ea2sm23811761b3a.4.2025.12.27.01.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 01:07:31 -0800 (PST)
Message-ID: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
Date: Sat, 27 Dec 2025 02:07:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: Linux 6.19-rc1 mediatek mt7921e broke badly
Content-Language: en-US
To: quan.zhou@mediatek.com, Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org,
 ryder.lee@mediatek.com, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, Shuah Khan <skhan@linuxfoundation.org>,
 shuah <shuah@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_010733_634883_2E303D06 
X-CRM114-Status: UNSURE (   8.63  )
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

bXQ3OTIxZSBkb2Vzbid0IGxvYWQgb24gbXkgcHJpbWFyeSBsYXB0b3BuIG9uIExpbnV4IDYu
MTktcmMxIGFuZCBwcm9ibGVtDQpzdGlsbCB0aGVyZSBvbiA2LjE5LXJjMi4NCg0KICBGcm9t
IHdoYXQgSSBjYW4gdGVsbCBmcm9tIGRtZXNnIGl0IGF0dGVtcHRzIHRvIGRvIGxvYWQgZmly
bXdhcmUNCmluIG10NzkyeF9sb2FkX2Zpcm13YXJlKCkgZHVyaW5nIGFuZCB0aGVuIGdlbmVy
YXRlcyB3YXJucyBhbmQNCmZhaWxzIHRvIGxvYWQgdGhlIG1vZHVsZS4gZG1lc2cgZXhjZXJw
dCBiZWxvdy4NCg0KY29tbWl0IDA2NmY0MTdiZTVmZDhjN2ZlNTgxYzU1NTAyMDYzNjQ3MzVk
YWQ3YTMNCkF1dGhvcjogUXVhbiBaaG91IDxxdWFuLnpob3VAbWVkaWF0ZWsuY29tPg0KRGF0
ZTogICBUdWUgTm92IDE4IDE5OjU0OjU0IDIwMjUgKzA4MDANCg0KICAgICAgd2lmaTogbXQ3
NjogbXQ3OTJ4OiBmaXggd2lmaSBpbml0IGZhaWwgYnkgc2V0dGluZyBNQ1VfUlVOTklORyBh
ZnRlciBDTEMgbG9hZA0KDQpUaGUgYWJvdmUgY29tbWl0IGNoYW5nZXMgd2hlbiB0aGUgTUNV
X1JVTk5JTkcgYml0IGlzIHNldCBpbiBtdDc5MjVfcnVuX2Zpcm13YXJlKCksDQpjaGFuZ2lu
ZyBpdCB0byBzZXQgdGhpcyBiaXQgb25seSBhZnRlciBtdDc5MjFfbG9hZF9jbGMoKSBjb21w
bGV0ZXMuDQoNCkkgZGlkbid0IGdldCBhIGNoYW5jZSB0byBiaXNlY3QgeWV0IGFuZCBhIHF1
aWNrIHJldmVydCBvZiB0aGUgcGF0Y2ggZGlkbid0IHNvbHZlDQp0aGUgcHJvYmxlbS4gVGhp
cyBpcyBhIHNlcmlvdXMgcHJvYmxlbSBmb3IgbWUgc2luY2UgbXkgd2lmaSBpcyBkZWFkIG9u
IG15DQpwcmltYXJ5IGxhcHRvcC4gSG9wZSBhIGZpeCBpcyBjb21pbmcgc29vbi4NCg0KSSBh
bSBhdmFpbGFibGUgZm9yIGRlYnVnL3Rlc3RpbmcgaGVscCBlYXJseSBuZXh0IHdlZWsuDQoN
CnRoYW5rcywNCi0tIFNodWFoDQoNCmRtZXNnDQo9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQoNCmtlcm4gIDpjcml0ICA6IGtlcm5lbCBCVUcgYXQgbGliL3N0cmluZ19oZWxw
ZXJzLmM6MTA0MyENCmtlcm4gIDp3YXJuICA6IE9vcHM6IGludmFsaWQgb3Bjb2RlOiAwMDAw
IFsjMV0gU01QIE5PUFRJDQprZXJuICA6d2FybiAgOiBDUFU6IDE0IFVJRDogMCBQSUQ6IDYx
IENvbW06IGt3b3JrZXIvMTQ6MCBUYWludGVkOiBHICAgICAgICBXDQogICAgICAgICA2LjE5
LjAtcmMxICMxIFBSRUVNUFQodm9sdW50YXJ5KQ0Ka2VybiAgOndhcm4gIDogVGFpbnRlZDog
W1ddPVdBUk4NCmtlcm4gIDp3YXJuICA6IEhhcmR3YXJlIG5hbWU6IEZyYW1ld29yayBMYXB0
b3AgMTMgKEFNRCBSeXplbiA3MDQwU2VyaWVzKS9GUkFOTURDUDA3LCBCSU9TIDAzLjE2IDA3
LzI1LzIwMjUNCmtlcm4gIDp3YXJuICA6IFdvcmtxdWV1ZTogZXZlbnRzIG10NzkyMV9pbml0
X3dvcmsgW210NzkyMV9jb21tb25dDQprZXJuICA6d2FybiAgOiBSSVA6IDAwMTA6X19mb3J0
aWZ5X3BhbmljKzB4ZC8weGYNCmtlcm4gIDp3YXJuICA6IENvZGU6IDY2IDJlIDBmIDFmIDg0
IDAwIDAwIDAwIDAwIDAwIDBmIDFmIDAwIDkwIDkwIDkwIDkwIDkwIDkwIDkwIDkwIDkwIDkw
IDkwIDkwIDkwIDkwIDkwIDkwIGYzIDBmIDFlIGZhIDQwIDBmIGI2IGZmIGU4IGMzIDU1IDcx
IDAwIDwwZj4gMGIgNDggOGIgNTQgMjQgMTAgNDggOGIgNzQgMjQgMDggNGMgODkgZTkgNDgg
YzcgYzcgMDAgYTIgZDUgYTANCmtlcm4gIDp3YXJuICA6IFJTUDogMDAxODpmZmZmYTdhNWMw
M2EzZDEwIEVGTEFHUzogMDAwMTAyNDYNCmtlcm4gIDp3YXJuICA6IFJBWDogZmZmZmZmZmZh
MGQ3YWFmMiBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNYOiBmZmZmZmZmZmEwZDdhYWYyDQpr
ZXJuICA6d2FybiAgOiBSRFg6IDAwMDAwMDAwMDAwMDAwMTEgUlNJOiBmZmZmZmZmZmEwZDVh
MTcwIFJESTogZmZmZmZmZmZhMTI4ZGIxMA0Ka2VybiAgOndhcm4gIDogUkJQOiBmZmZmOTE2
NTBhZTUyMDYwIFIwODogMDAwMDAwMDAwMDAwMDAxMCBSMDk6IGZmZmZhN2E1YzMxYjIwMDAN
Cmtlcm4gIDp3YXJuICA6IFIxMDogZmZmZmE3YTVjMDNhM2JmMCBSMTE6IDAwMDAwMDAwZmZm
ZmZmZmYgUjEyOiAwMDAwMDAwMDAwMDAwMDAwDQprZXJuICA6d2FybiAgOiBSMTM6IGZmZmZh
N2E1YzMxYjIwMDAgUjE0OiAwMDAwMDAwMDAwMDAxMDAwIFIxNTogMDAwMDAwMDAwMDAwMDAw
MA0Ka2VybiAgOndhcm4gIDogRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY5
MTc0M2U2NjQwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0Ka2VybiAgOndhcm4g
IDogQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0K
a2VybiAgOndhcm4gIDogQ1IyOiAwMDAwN2YxMDc4NmMyNDFjIENSMzogMDAwMDAwMDNlY2Ey
NDAwMCBDUjQ6IDAwMDAwMDAwMDBmNTBlZjANCmtlcm4gIDp3YXJuICA6IFBLUlU6IDU1NTU1
NTU0DQprZXJuICA6d2FybiAgOiBDYWxsIFRyYWNlOg0Ka2VybiAgOndhcm4gIDogIDxUQVNL
Pg0Ka2VybiAgOndhcm4gIDogIG10NzZfY29ubmFjMl9sb2FkX3BhdGNoLmNvbGQrMHgyYi8w
eGE0MSBbbXQ3Nl9jb25uYWNfbGliXQ0Ka2VybiAgOndhcm4gIDogID8gc3Jzb19hbGlhc19y
ZXR1cm5fdGh1bmsrMHg1LzB4ZmJlZjUNCmtlcm4gIDp3YXJuICA6ICBtdDc5MnhfbG9hZF9m
aXJtd2FyZSsweDM2LzB4MTUwIFttdDc5MnhfbGliXQ0Ka2VybiAgOndhcm4gIDogIG10Nzky
MV9ydW5fZmlybXdhcmUrMHgyYy8weDRhMCBbbXQ3OTIxX2NvbW1vbl0NCmtlcm4gIDp3YXJu
ICA6ICA/IHNyc29fYWxpYXNfcmV0dXJuX3RodW5rKzB4NS8weGZiZWY1DQprZXJuICA6d2Fy
biAgOiAgPyBtdDc5MjFfcnIrMHgxMi8weDMwIFttdDc5MjFlXQ0Ka2VybiAgOndhcm4gIDog
ID8gc3Jzb19hbGlhc19yZXR1cm5fdGh1bmsrMHg1LzB4ZmJlZjUNCmtlcm4gIDp3YXJuICA6
ICA/IF9fX19tdDc2X3BvbGxfbXNlYysweDc1LzB4YjAgW210NzZdDQprZXJuICA6d2FybiAg
OiAgbXQ3OTIxZV9tY3VfaW5pdCsweDRjLzB4N2EgW210NzkyMWVdDQprZXJuICA6d2FybiAg
OiAgbXQ3OTIxX2luaXRfd29yaysweDUxLzB4MTkwIFttdDc5MjFfY29tbW9uXQ0Ka2VybiAg
Ondhcm4gIDogIHByb2Nlc3Nfb25lX3dvcmsrMHgxOGIvMHgzNDANCmtlcm4gIDp3YXJuICA6
ICB3b3JrZXJfdGhyZWFkKzB4MjU2LzB4M2EwDQprZXJuICA6d2FybiAgOiAgPyBfX3BmeF93
b3JrZXJfdGhyZWFkKzB4MTAvMHgxMA0Ka2VybiAgOndhcm4gIDogIGt0aHJlYWQrMHhmYy8w
eDI0MA0Ka2VybiAgOndhcm4gIDogID8gX19wZnhfa3RocmVhZCsweDEwLzB4MTANCmtlcm4g
IDp3YXJuICA6ICA/IF9fcGZ4X2t0aHJlYWQrMHgxMC8weDEwDQprZXJuICA6d2FybiAgOiAg
cmV0X2Zyb21fZm9yaysweDI1NC8weDI5MA0Ka2VybiAgOndhcm4gIDogID8gX19wZnhfa3Ro
cmVhZCsweDEwLzB4MTANCmtlcm4gIDp3YXJuICA6ICByZXRfZnJvbV9mb3JrX2FzbSsweDFh
LzB4MzANCmtlcm4gIDp3YXJuICA6ICA8L1RBU0s+DQprZXJuICA6d2FybiAgOiBNb2R1bGVz
IGxpbmtlZCBpbjogc25kX2hkYV9jb2RlY19hbGMyNjkoKykgc25kX3NvZl9hbWRfcmVtYnJh
bmR0IG10NzkyMWUgc25kX2hkYV9zY29kZWNfY29tcG9uZW50IHNuZF9zb2ZfYW1kX2FjcCBz
bmRfaGRhX2NvZGVjX3JlYWx0ZWtfbGliIG10NzkyMV9jb21tb24gc25kX3NvZl9wY2kgc25k
X3NvZl94dGVuc2FfZHNwIHNuZF9oZGFfY29kZWNfZ2VuZXJpYyBidHVzYiBhbWRfYXRsIG10
NzkyeF9saWIgdXZjdmlkZW8gc25kX2hkYV9jb2RlY19hdGloZG1pIGludGVsX3JhcGxfbXNy
IG10NzZfY29ubmFjX2xpYiBzbmRfc29mIGJ0cnRsIGludGVsX3JhcGxfY29tbW9uIHNuZF9o
ZGFfY29kZWNfaGRtaSBidGludGVsIHZpZGVvYnVmMl92bWFsbG9jIG10NzYgdmlkZW9idWYy
X21lbW9wcyBidGJjbSB1dmMgc25kX3NvZl91dGlscyB2aWRlb2J1ZjJfdjRsMiBrdm1fYW1k
IGJ0bXRrIGhpZF9zZW5zb3JfYWxzIHNuZF9oZGFfaW50ZWwgbWFjODAyMTEgaGlkX3NlbnNv
cl90cmlnZ2VyIHNuZF9zb2NfY29yZSB2aWRlb2RldiBibHVldG9vdGggc25kX2hkYV9jb2Rl
YyBpbmR1c3RyaWFsaW9fdHJpZ2dlcmVkX2J1ZmZlciBoaWRfc2Vuc29yX2lpb19jb21tb24g
c25kX2NvbXByZXNzIHZpZGVvYnVmMl9jb21tb24ga3ZtIHNuZF9od2RlcCBsaWJhcmM0IGtm
aWZvX2J1ZiBzbmRfcGNpX3BzIGluZHVzdHJpYWxpbyBzbmRfc29jX2FjcGlfYW1kX21hdGNo
IG1jIHNuZF9oZGFfY29yZSBzbmRfcnBsX3BjaV9hY3A2eCBpcnFieXBhc3MgY2ZnODAyMTEg
c25kX2ludGVsX2RzcGNmZyBzbmRfcGNpX2FjcDZ4IGFtZF9wbWYgcmFwbCBzbmRfcGNpX2Fj
cDV4IHNuZF9wY20gYW1kdGVlIGxlZHNfY3Jvc19lYyBzbmRfcm5fcGNpX2FjcDN4IGhpZF9z
ZW5zb3JfaHViIHdtaV9ibW9mIHNuZF90aW1lciBsZWRfY2xhc3NfbXVsdGljb2xvciBzbmRf
YWNwX2NvbmZpZyBzbmRfc29jX2FjcGkgY3Jvc19lY19od21vbiBzbmQgc3BkNTExOCBjY3Ag
c25kX3BjaV9hY3AzeCBwY3Nwa3IgcGxhdGZvcm1fcHJvZmlsZQ0Ka2VybiAgOndhcm4gIDog
IHNvdW5kY29yZSByZmtpbGwgazEwdGVtcCBhYyBidXR0b24gYW1kX3NmaCB0ZWUgYW1kX3Bt
YyBqb3lkZXYgZXZkZXYgbXNyIHBhcnBvcnRfcGMgcHBkZXYgbHAgcGFycG9ydCBjb25maWdm
cyBlZmlfcHN0b3JlIG5mbmV0bGluayBlZml2YXJmcyBhdXRvZnM0IGV4dDQgbWJjYWNoZSBq
YmQyIGRtX2NyeXB0IGRtX21vZCB1c2JoaWQgYW1kZ3B1IGFtZHhjcCBpMmNfYWxnb19iaXQg
ZHJtX2NsaWVudF9saWIgZHJtX3R0bV9oZWxwZXIgdHRtIHVjc2lfYWNwaSB0eXBlY191Y3Np
IGRybV9leGVjIGRybV9wYW5lbF9iYWNrbGlnaHRfcXVpcmtzIHJvbGVzIGdwdV9zY2hlZCBo
aWRfbXVsdGl0b3VjaCB0eXBlYyBkcm1fc3ViYWxsb2NfaGVscGVyIGRybV9idWRkeSBoaWRf
Z2VuZXJpYyB4aGNpX3BjaSBkcm1fZGlzcGxheV9oZWxwZXIgY3Jvc19lY19kZWJ1Z2ZzIGNy
b3NfZWNfc3lzZnMgY3Jvc19jaGFyZ2VfY29udHJvbCBjcm9zX2VjX2NoYXJkZXYgY3Jvc19r
YmRfbGVkX2JhY2tsaWdodCBpMmNfaGlkX2FjcGkgeGhjaV9oY2QgaTJjX2hpZCBoaWQgZHJt
X2ttc19oZWxwZXIgc3A1MTAwX3RjbyB3YXRjaGRvZyBjcm9zX2VjX2RldiB0aHVuZGVyYm9s
dCBkcm0gdXNiY29yZSBudm1lIGdoYXNoX2NsbXVsbmlfaW50ZWwgY2VjIGFlc25pX2ludGVs
IG52bWVfY29yZSByY19jb3JlIHNlcmlvX3JhdyBpMmNfcGlpeDQgaTJjX3NtYnVzIGNyYzE2
IHZpZGVvIHVzYl9jb21tb24gYmF0dGVyeSB3bWkgY3Jvc19lY19scGNzIGNyb3NfZWMgY3Jv
c19lY19wcm90bw0K

