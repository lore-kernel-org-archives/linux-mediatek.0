Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE93C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 15:52:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E4CE20878
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 15:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OAJQt5/R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0Z9HFPN5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E4CE20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IMZ8b9/RU1W+p5nIudshYUI2HAHzLBpBvIm1QnAa4/4=; b=OAJQt5/R06+iFc296pXUKMpJr
	Apyse+HbQm3O1/thIo6x22tF32l6hB/y+N2Cgym55tBnkfDl0sGIctTzbSrW1/8lm89eT0ZupauII
	QTXoFBtrUxIhAZlUAXfXLy14zIG8ozwvr6N9qcngFDb46BWz2g+L9InphjAuoJglOTdUwLvTqg/9A
	30fMNdlkHiOhYs3ax38N2YB1dE6ZJ4Hl+8sRmo6oGoPbQnM5Dy6awVZXqHovJZbvMyV2lGapRK6OS
	hOUJEVT/xpw/aV4PHGZv9kyRVMhkafR0FP+xM74tnIhvaurW3bFKkTfuddz7bqUwLmr+Nu5NlvZKn
	pWsdTPH+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVzMv-0004cj-Ou; Fri, 23 Oct 2020 15:52:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVzMp-0004ac-KU; Fri, 23 Oct 2020 15:52:36 +0000
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0765020795;
 Fri, 23 Oct 2020 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603468354;
 bh=UqiBU0IVvWwjw9aBiH3MdRxRMS7aPSW9F28A6auwWrw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0Z9HFPN5Sdtl8JKgP0G+XrSnC/XWCPYRk4Io18Rushg4Xmc+W0iehTMl+pKbrVPHA
 k0NjI9+KxNUs4zfaDHtf/1lzU/F40I2N0WifVGvfPr8e8U1UUQPW/8IDOqyu2H6Tpd
 nilIplOCJEIFLg5h5B5lOgQxrd5FRRxshtw9lLgE=
Received: by mail-ed1-f44.google.com with SMTP id bc23so2010655edb.5;
 Fri, 23 Oct 2020 08:52:33 -0700 (PDT)
X-Gm-Message-State: AOAM530Dk1sUU64stEptQ290N9SSHLfYCxfuLvZdijftT6qjIFjz7CEq
 9nMShZ2MICZw6UW0sxR1XyOVHxcdHnmHN0OhZQ==
X-Google-Smtp-Source: ABdhPJzdmjU4HyJf9LFyBtcFyE62bogi7FwJWjjwCC3gI5A4C6dnpOf0hsr+qjEfhYN883OsWlCNT6Z2X0GSz/vFEt8=
X-Received: by 2002:a05:6402:c12:: with SMTP id
 co18mr2757331edb.162.1603468352366; 
 Fri, 23 Oct 2020 08:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-6-fparent@baylibre.com>
In-Reply-To: <20201023133130.194140-6-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 23 Oct 2020 23:52:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ZgoQJFnEDDZ=JCy-3zLwn7yjk1EHVYgeSG2ufLxK04g@mail.gmail.com>
Message-ID: <CAAOTY_8ZgoQJFnEDDZ=JCy-3zLwn7yjk1EHVYgeSG2ufLxK04g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/mediatek: Add support for main DDP path on
 MT8167
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_115235_868400_28946ED7 
X-CRM114-Status: GOOD (  19.27  )
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
Cc: DTML <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjPml6Ug6YCx5LqUIOS4i+WNiDk6MzHlr6vpgZPvvJoKPgo+IEFkZCB0aGUgbWFp
biAoRFNJKSBkcm0gZGlzcGxheSBwYXRoIGZvciBNVDgxNjcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBG
YWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAtLS0KPgo+IENoYW5nZWxvZzoK
Pgo+IFYyOiBObyBjaGFuZ2UKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
OCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+
IGluZGV4IDU5Yzg1YzYzYjdjYy4uMzk1MjQzNTA5M2ZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmMKPiBAQCAtMTEyLDYgKzExMiwxNyBAQCBzdGF0aWMgY29uc3Qg
ZW51bSBtdGtfZGRwX2NvbXBfaWQgbXQyNzEyX210a19kZHBfdGhpcmRbXSA9IHsKPiAgICAgICAg
IEREUF9DT01QT05FTlRfUFdNMiwKPiAgfTsKPgo+ICtzdGF0aWMgZW51bSBtdGtfZGRwX2NvbXBf
aWQgbXQ4MTY3X210a19kZHBfbWFpbltdID0gewo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkww
LAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9DT0xPUjAsCj4gKyAgICAgICBERFBfQ09NUE9ORU5U
X0NDT1JSLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9BQUwwLAo+ICsgICAgICAgRERQX0NPTVBP
TkVOVF9HQU1NQSwKPiArICAgICAgIEREUF9DT01QT05FTlRfRElUSEVSLAo+ICsgICAgICAgRERQ
X0NPTVBPTkVOVF9SRE1BMCwKPiArICAgICAgIEREUF9DT01QT05FTlRfRFNJMCwKPiArfTsKPiAr
Cj4gIHN0YXRpYyBjb25zdCBlbnVtIG10a19kZHBfY29tcF9pZCBtdDgxNzNfbXRrX2RkcF9tYWlu
W10gPSB7Cj4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTDAsCj4gICAgICAgICBERFBfQ09NUE9O
RU5UX0NPTE9SMCwKPiBAQCAtMTYzLDYgKzE3NCwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19tbXN5c19kcml2ZXJfZGF0YSBtdDgxNzNfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAg
ICAuZXh0X2xlbiA9IEFSUkFZX1NJWkUobXQ4MTczX210a19kZHBfZXh0KSwKPiAgfTsKPgo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDgxNjdfbW1zeXNfZHJp
dmVyX2RhdGEgPSB7Cj4gKyAgICAgICAubWFpbl9wYXRoID0gbXQ4MTY3X210a19kZHBfbWFpbiwK
PiArICAgICAgIC5tYWluX2xlbiA9IEFSUkFZX1NJWkUobXQ4MTY3X210a19kZHBfbWFpbiksCj4g
K307Cj4gKwo+ICBzdGF0aWMgaW50IG10a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRybSkKPiAgewo+ICAgICAgICAgc3RydWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZSA9IGRy
bS0+ZGV2X3ByaXZhdGU7Cj4gQEAgLTQwMSwyNiArNDE3LDQyIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgY29tcG9uZW50X21hc3Rlcl9vcHMgbXRrX2RybV9vcHMgPSB7Cj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kZHBfY29tcF9kdF9pZHNbXSA9IHsKPiAgICAgICAgIHsg
LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRpc3Atb3ZsIiwKPiAgICAgICAgICAgLmRh
dGEgPSAodm9pZCAqKU1US19ESVNQX09WTCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxNjctZGlzcC1vdmwiLAo+ICsgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRL
X0RJU1BfT1ZMIH0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1k
aXNwLW92bCIsCj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9PVkwgfSwKPiAg
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRpc3AtcmRtYSIsCj4gICAg
ICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9SRE1BIH0sCj4gKyAgICAgICB7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE2Ny1kaXNwLXJkbWEiLAo+ICsgICAgICAgICAuZGF0YSA9
ICh2b2lkICopTVRLX0RJU1BfUkRNQSB9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxNzMtZGlzcC1yZG1hIiwKPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19E
SVNQX1JETUEgfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRp
c3Atd2RtYSIsCj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9XRE1BIH0sCj4g
KyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE2Ny1kaXNwLWNjb3JyIiwKPiAr
ICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX0NDT1JSIH0sCj4gICAgICAgICB7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1kaXNwLWNvbG9yIiwKPiAgICAgICAgICAgLmRh
dGEgPSAodm9pZCAqKU1US19ESVNQX0NPTE9SIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE2Ny1kaXNwLWNvbG9yIiwKPiArICAgICAgICAgLmRhdGEgPSAodm9pZCAq
KU1US19ESVNQX0NPTE9SIH0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE3My1kaXNwLWNvbG9yIiwKPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX0NP
TE9SIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE2Ny1kaXNwLWFh
bCIsCj4gKyAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9BQUx9LAo+ICAgICAgICAg
eyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1hYWwiLAo+ICAgICAgICAgICAu
ZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfQUFMfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTY3LWRpc3AtZ2FtbWEiLAo+ICsgICAgICAgICAuZGF0YSA9ICh2b2lkICop
TVRLX0RJU1BfR0FNTUEsIH0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE3My1kaXNwLWdhbW1hIiwKPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX0dB
TU1BLCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctZGlzcC1k
aXRoZXIiLAo+ICsgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfRElUSEVSIH0sCj4g
ICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kaXNwLXVmb2UiLAo+ICAg
ICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfVUZPRSB9LAo+ICAgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZHNpIiwKPiAgICAgICAgICAgLmRhdGEgPSAodm9p
ZCAqKU1US19EU0kgfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3
LWRzaSIsCj4gKyAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRFNJIH0sCj4gICAgICAgICB7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kc2kiLAo+ICAgICAgICAgICAuZGF0YSA9
ICh2b2lkICopTVRLX0RTSSB9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDI3MDEtZHBpIiwKPiBAQCAtNDMxLDEwICs0NjMsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgbXRrX2RkcF9jb21wX2R0X2lkc1tdID0gewo+ICAgICAgICAgICAuZGF0YSA9
ICh2b2lkICopTVRLX0RJU1BfTVVURVggfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQyNzEyLWRpc3AtbXV0ZXgiLAo+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRL
X0RJU1BfTVVURVggfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3
LWRpc3AtbXV0ZXgiLAo+ICsgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfTVVURVgg
fSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRpc3AtbXV0ZXgi
LAo+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfTVVURVggfSwKPiAgICAgICAg
IHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRpc3AtcHdtIiwKPiAgICAgICAgICAg
LmRhdGEgPSAodm9pZCAqKU1US19ESVNQX0JMUyB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDgxNjctZGlzcC1wd20iLAo+ICsgICAgICAgICAuZGF0YSA9ICh2b2lkICop
TVRLX0RJU1BfUFdNIH0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3
My1kaXNwLXB3bSIsCj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9QV00gfSwK
PiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRpc3Atb2QiLAo+IEBA
IC00NDksNiArNDg1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2Ry
bV9vZl9pZHNbXSA9IHsKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ3NjIzX21tc3lzX2RyaXZlcl9k
YXRhfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEyLW1tc3lzIiwK
PiAgICAgICAgICAgLmRhdGEgPSAmbXQyNzEyX21tc3lzX2RyaXZlcl9kYXRhfSwKPiArICAgICAg
IHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LW1tc3lzIiwKClRoaXMgcGF0Y2ggbG9v
a3MgZ29vZCB0byBtZSwgYnV0IGl0IGRlcGVuZCBvbiBhbm90aGVyIHBhdGNoIHdoaWNoCmRlZmlu
ZSB0aGUgY29tcGF0aWJsZSAibWVkaWF0ZWssbXQ4MTY3LW1tc3lzIi4gV2hlcmUgaXMgdGhhdCBw
YXRjaD8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsgICAgICAgICAuZGF0YSA9ICZtdDgxNjdf
bW1zeXNfZHJpdmVyX2RhdGF9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxNzMtbW1zeXMiLAo+ICAgICAgICAgICAuZGF0YSA9ICZtdDgxNzNfbW1zeXNfZHJpdmVyX2Rh
dGF9LAo+ICAgICAgICAgeyB9Cj4gLS0KPiAyLjI4LjAKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
