Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9ACC38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 22:05:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D45F620735
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 22:05:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fErQBSdB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kOcLODoK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D45F620735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvmzIM0G5c8C65pUgrYDS+1ssQA7/kNh0ftmVCWDs9E=; b=fErQBSdBMtZXfm
	1Qh1bpmiUWfPlAP1Jiw9JzJDnayeIZ98Img3DQBjPaiNUTZtUN+p+QhiL0MLHHsdNNWqJusMuZOVR
	ODpw9j0ZlEVjtX8VSbyDg2pBStq6u3yEZYyp1TyEhaEgW/LcwoCsOVEUZ7PXxs6hrcwZ7XVz6F0Yc
	v2aEl+sh6qXDKYIkwupjWZkb3Vg5msPMyfrV5u7WQllT1kMYXGzI4+kp0/xLD282TewQtJFmzq79l
	xRQk03ncySve4FGcemMgrySbK5KDWbdLC049IyP6mDvRcbf+CSyDfQiD2Z7jUe6/8RbPtPeaUUGfx
	Vs6ztJebKhPBHsgVGy3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWodr-0001Et-K9; Thu, 07 May 2020 22:05:19 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWodp-0001EK-70
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 22:05:18 +0000
Received: by mail-lj1-x243.google.com with SMTP id f18so8006712lja.13
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nPPvWhYSDBZH/W9ZzOHKWz2UFG4yFEnZgxOOVnctufk=;
 b=kOcLODoKztByz0UBmzjXeqlmhusevIjl+c2HbLw3k5rPnNKk0UOKclN/cgZBe7f2BE
 KEqsud4Rf5RdhjLb6rTlhUM5ds3Xzk7FnKfAsKFuTOitseFo/B4W7DCsQHn6MIDZOtdM
 XpjV+SB82Z1h1ka5YTJZ7+6LcnBoSsPmQiuy7w3g1RSKnALtjhnggH/JTqnX8Bs27TGN
 ood1tyTML/spLGCWlwrocHp6j+kCbFQp1TxUGnP/5eZHSKTDWrjMVOJMV0mMmz5OWK8f
 xD7VPnGMNREiVpMw0n8DDrvcOIkqDBd0J/2WjILG0vEpGGnV+iSSQP4JFsm6KT8nJ2Q/
 xEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nPPvWhYSDBZH/W9ZzOHKWz2UFG4yFEnZgxOOVnctufk=;
 b=c6mD0aSoL9+qc6i17u1eU+GNb8IpbFTVVxTsolidWLyd0e38KGoQoEZZ3/NOsMVYPn
 eQ1GgAQphEgwqKEFTlzRdi/mh1Y/JSSjFSNkUsfLAH7FCoPGeyIIFBvoYTzevSPA35kf
 xtK+ZRmjnwywHooUdweoylv/rlz2z7ev3vr3eMyBICillrT4Nf2kyKytCKdfACQQe4aR
 kUyiJujU9CiYDVTu/fOZUpmCNT3+aWpoHNby5qRCfhmTylrBentvXOa+JNtid/SVaEXV
 N3vubpNosyAh4Srw5aGU5X5d0bNrQVx26H492a8AA4JuSAUZoLQHOoBpuZPi5/bNpsFa
 DeOw==
X-Gm-Message-State: AGi0PuZ5FJsenjVwbf8sWehDKNoVLn3CWIdsnoCCoHArRhvOSZ9FakKH
 ezs87PBpZqxL0W+XijXZWP8jjzoj0/7POPhzoUxNTw==
X-Google-Smtp-Source: APiQypKNdCY3OtiIkeJWX0PcE2nxNIMwzLCH+DsayspwmtDmIkVB8t6LffEY5ZO8WubCZPRo18ZG04Dd+peMVypsg08=
X-Received: by 2002:a2e:2e16:: with SMTP id u22mr10215821lju.243.1588889114309; 
 Thu, 07 May 2020 15:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
 <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
 <20200507064412.GL2042@localhost> <20200507064734.GA798308@kroah.com>
 <20200507111312.GA1497799@kroah.com>
In-Reply-To: <20200507111312.GA1497799@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 8 May 2020 03:35:02 +0530
Message-ID: <CA+G9fYu2SrkEHyAzF57xJz5WjgHv361qdL2wPqON_pGS4Vtxmw@mail.gmail.com>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_150517_288272_ED470D63 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, lkft-triage@lists.linaro.org,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCA3IE1heSAyMDIwIGF0IDE2OjQzLCBHcmVnIEtyb2FoLUhhcnRtYW4KPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo8dHJpbT4KPiA+ID4KPiA+ID4gR3JlZywgM2Y2
NTA0N2M4NTNhICgib2ZfbWRpbzogYWRkIGhlbHBlciB0byBkZXJlZ2lzdGVyIGZpeGVkLWxpbmsK
PiA+ID4gUEhZcyIpIG5lZWRzIHRvIGJlIGJhY2twb3J0ZWQgYXMgd2VsbCBmb3IgdGhlc2UuCj4g
PiA+Cj4gPiA+IE9yaWdpbmFsIHNlcmllcyBjYW4gYmUgZm91bmQgaGVyZToKPiA+ID4KPiA+ID4g
ICAgIGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMTQ4MDM1NzUwOS0yODA3NC0xLWdpdC1zZW5k
LWVtYWlsLWpvaGFuQGtlcm5lbC5vcmcKPiA+Cj4gPiBBaCwgdGhhbmtzIGZvciB0aGF0LCBJIHRo
b3VnaHQgSSBkcm9wcGVkIGFsbCBvZiB0aGUgb25lcyB0aGF0IGNhdXNlZAo+ID4gYnVpbGQgZXJy
b3JzLCBidXQgbWlzc2VkIHRoZSBhYm92ZSBvbmUuICBJJ2xsIGdvIHRha2UgdGhlIHdob2xlIHNl
cmllcwo+ID4gaW5zdGVhZC4KPgo+IFRoaXMgc2hvdWxkIG5vdyBhbGwgYmUgZml4ZWQgdXAsIHRo
YW5rcy4KCldoaWxlIGJ1aWxkaW5nIGtlcm5lbCBJbWFnZSBmb3IgYXJtIGFyY2hpdGVjdHVyZSBv
biBzdGFibGUtcmMgNC40IGJyYW5jaAp0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yIGZvdW5kLgoK
b2ZfbWRpbzogYWRkIGhlbHBlciB0byBkZXJlZ2lzdGVyIGZpeGVkLWxpbmsgUEhZcwpjb21taXQg
M2Y2NTA0N2M4NTNhMmE1YWJjZDhhYzE5ODRhZjM0NTJiNWRmNGFkYSB1cHN0cmVhbS4KCkFkZCBo
ZWxwZXIgdG8gZGVyZWdpc3RlciBmaXhlZC1saW5rIFBIWXMgcmVnaXN0ZXJlZCB1c2luZwpvZl9w
aHlfcmVnaXN0ZXJfZml4ZWRfbGluaygpLgoKQ29udmVydCB0aGUgdHdvIGRyaXZlcnMgdGhhdCBj
YXJlIHRvIGRlcmVnaXN0ZXIgdGhlaXIgZml4ZWQtbGluayBQSFlzIHRvCnVzZSB0aGUgbmV3IGhl
bHBlciwgYnV0IG5vdGUgdGhhdCBtb3N0IGRyaXZlcnMgY3VycmVudGx5IGZhaWwgdG8gZG8gc28u
CgpTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+ClNpZ25lZC1v
ZmYtYnk6IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KW29ubHkgdGFrZSBo
ZWxwZXIgZnVuY3Rpb24gZm9yIDQuNC55IC0gZ3JlZ2toXQoKICMgbWFrZSAtc2sgS0JVSUxEX0JV
SUxEX1VTRVI9VHV4QnVpbGQgLUMvbGludXggLWoxNiBBUkNIPWFybQpDUk9TU19DT01QSUxFPWFy
bS1saW51eC1nbnVlYWJpaGYtIEhPU1RDQz1nY2MgQ0M9InNjY2FjaGUKYXJtLWxpbnV4LWdudWVh
YmloZi1nY2MiIE89YnVpbGQgekltYWdlCjcwICMKNzEgLi4vZHJpdmVycy9vZi9vZl9tZGlvLmM6
IEluIGZ1bmN0aW9uIOKAmG9mX3BoeV9kZXJlZ2lzdGVyX2ZpeGVkX2xpbmvigJk6CjcyIC4uL2Ry
aXZlcnMvb2Yvb2ZfbWRpby5jOjM3OToyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YK
ZnVuY3Rpb24g4oCYZml4ZWRfcGh5X3VucmVnaXN0ZXLigJk7IGRpZCB5b3UgbWVhbiDigJhmaXhl
ZF9waHlfcmVnaXN0ZXLigJk/ClstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9u
XQo3MyAgMzc5IHwgZml4ZWRfcGh5X3VucmVnaXN0ZXIocGh5ZGV2KTsKNzQgIHwgXn5+fn5+fn5+
fn5+fn5+fn5+fn4KNzUgIHwgZml4ZWRfcGh5X3JlZ2lzdGVyCjc2IC4uL2RyaXZlcnMvb2Yvb2Zf
bWRpby5jOjM4MToyMjogZXJyb3I6IOKAmHN0cnVjdCBwaHlfZGV2aWNl4oCZIGhhcyBubwptZW1i
ZXIgbmFtZWQg4oCYbWRpb+KAmTsgZGlkIHlvdSBtZWFuIOKAmG1kaXjigJk/Cjc3ICAzODEgfCBw
dXRfZGV2aWNlKCZwaHlkZXYtPm1kaW8uZGV2KTsgLyogb2ZfcGh5X2ZpbmRfZGV2aWNlKCkgKi8K
NzggIHwgXn5+fgo3OSAgfCBtZGl4Cgo+Cj4gZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
