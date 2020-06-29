Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD835C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 08:11:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE1923340
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 08:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YXUb4o7w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVlL9y6s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FE1923340
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hfEhHCJCqDnD3ofrWR/kDHQU0g+ruATQSKA3+33SXAw=; b=YXUb4o7wlEhNR748uAo8c7F+o
	VG9ekrNNEPd8L1fD1/z1iz6vWzJkuGhB9fnv/lEnEY6OE5MoK6pQN0k4hRtF0949b/nvrEYZMyiI/
	frTQDlqYZXpAKqB09PyTazETVDBlWGd9TjS9hXSKHY/XFJ+WreYmV5OJwTNKytsAqD5UxieImU0ud
	GtGv2te1ttcxCgqjDbpUCiE1N2Bt5Gzc4wP6uJ8l/IZc39JrHSJ164VKlFZHxj/ktk7OruN1rpY5I
	b2AWGG+qZWUSa6bnqQONn9CurcRR/7ynAelH5XMOsCLCqP9P9Eu+eieBrf6wzwe0Jh5mSWXOoq1Jo
	K3Awtw9ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jposY-0000yY-PJ; Mon, 29 Jun 2020 08:11:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jposT-0000wj-9x; Mon, 29 Jun 2020 08:10:58 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20B282333C;
 Mon, 29 Jun 2020 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593418256;
 bh=vPDldX/OJgl8GaW3Xll0Qf3Mn2CYsqcjnat3j+9TZYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZVlL9y6spoDbUQbeqfwoml8Esl7npD20YlZM0kWQxJCgA3zh2OMEm1uqSvPc/vmzm
 VMRF8VxrdD/0e1IKLLbe8pEegiop5mQmNUFKF2AxsqUIlKnF6dao1QWD4mqhVGnStR
 xDzzLNGlP/a2qMf8rWWisRIXTUtxjEm5TkLsxO2w=
Date: Mon, 29 Jun 2020 10:10:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH 1/2] usb: mtu3: disable USB2 LPM
Message-ID: <20200629081047.GB1221843@kroah.com>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <af16d716-8bb3-ea1f-e410-b27443f74c31@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af16d716-8bb3-ea1f-e410-b27443f74c31@web.de>
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
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMjksIDIwMjAgYXQgMDk6MzA6NThBTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBBIFN1cGVyU3BlZWQgZGV2aWNlIHNoYWxsIGluY2x1ZGUgdGhlIFVTQiAyLjAg
ZXh0ZW5zaW9uIGRlc2NyaXB0b3IKPiA+IGFuZCBzaGFsbCBzdXBwb3J0IExQTSB3aGVuIG9wZXJh
dGluZyBpbiBVU0IgMi4wIEhTIG1vZGUoc2VlIHVzYjMuMgo+ID4gc3BlYzkuNi4yLjEpLiBCdXQg
d2UgYWx3YXlzIGRvbid0IHN1cHBvcnQgaXQsIHNvIGRpc2FibGUgaXQgYnkKPiA+IGRlZmF1bHQs
IG90aGVyd2lzZSBkZXZpY2Ugd2lsbCBlbnRlciBMUE0gc3VzcGVuZCBtb2RlIHdoZW4KPiA+IGNv
bm5lY3RlZCB0byBXaW4xMCBzeXN0ZW0uCj4gCj4gSG93IGRvIHlvdSB0aGluayBhYm91dCBhIHdv
cmRpbmcgdmFyaWFudCBsaWtlIHRoZSBmb2xsb3dpbmc/Cj4gCj4gICAgQ2hhbmdlIGRlc2NyaXB0
aW9uOgo+ICAgIEEgU3VwZXJTcGVlZCBkZXZpY2Ugc2hhbGwgaW5jbHVkZSB0aGUgVVNCIDIuMCBl
eHRlbnNpb24gZGVzY3JpcHRvcgo+ICAgIGFuZCBzaGFsbCBzdXBwb3J0IExpbmsgUG93ZXIgTWFu
YWdlbWVudCB3aGVuIG9wZXJhdGluZyBpbiBVU0IgMi4wCj4gICAgSGlnaCBTcGVlZCBtb2RlLiAo
U2VlIGFsc286IFVTQiAzLjIgc3BlY2lmaWNhdGlvbiA5LjYuMi4xKQo+ICAgIEJ1dCB3ZSBkbyBu
b3Qgc3VwcG9ydCBpdCBnZW5lcmFsbHkuIFRodXMgZGlzYWJsZSB0aGlzIGZ1bmN0aW9uYWxpdHkK
PiAgICBieSBkZWZhdWx0Lgo+ICAgIE90aGVyd2lzZSwgdGhlIGRldmljZSB3aWxsIGVudGVyIExQ
TSBzdXNwZW5kIG1vZGUgd2hlbiBjb25uZWN0ZWQKPiAgICB0byBXaW4xMCBzeXN0ZW0uCj4gCj4g
Cj4gV291bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gdG8gdGhlIGNvbW1p
dCBtZXNzYWdlPwo+IAo+IFJlZ2FyZHMsCj4gTWFya3VzCgpIaSwKClRoaXMgaXMgdGhlIHNlbWkt
ZnJpZW5kbHkgcGF0Y2gtYm90IG9mIEdyZWcgS3JvYWgtSGFydG1hbi4KCk1hcmt1cywgeW91IHNl
ZW0gdG8gaGF2ZSBzZW50IGEgbm9uc2Vuc2ljYWwgb3Igb3RoZXJ3aXNlIHBvaW50bGVzcwpyZXZp
ZXcgY29tbWVudCB0byBhIHBhdGNoIHN1Ym1pc3Npb24gb24gYSBMaW51eCBrZXJuZWwgZGV2ZWxv
cGVyIG1haWxpbmcKbGlzdC4gIEkgc3Ryb25nbHkgc3VnZ2VzdCB0aGF0IHlvdSBub3QgZG8gdGhp
cyBhbnltb3JlLiAgUGxlYXNlIGRvIG5vdApib3RoZXIgZGV2ZWxvcGVycyB3aG8gYXJlIGFjdGl2
ZWx5IHdvcmtpbmcgdG8gcHJvZHVjZSBwYXRjaGVzIGFuZApmZWF0dXJlcyB3aXRoIGNvbW1lbnRz
IHRoYXQsIGluIHRoZSBlbmQsIGFyZSBhIHdhc3RlIG9mIHRpbWUuCgpQYXRjaCBzdWJtaXR0ZXIs
IHBsZWFzZSBpZ25vcmUgTWFya3VzJ3Mgc3VnZ2VzdGlvbjsgeW91IGRvIG5vdCBuZWVkIHRvCmZv
bGxvdyBpdCBhdCBhbGwuICBUaGUgcGVyc29uL2JvdC9BSSB0aGF0IHNlbnQgaXQgaXMgYmVpbmcg
aWdub3JlZCBieQphbG1vc3QgYWxsIExpbnV4IGtlcm5lbCBtYWludGFpbmVycyBmb3IgaGF2aW5n
IGEgcGVyc2lzdGVudCBwYXR0ZXJuIG9mCmJlaGF2aW9yIG9mIHByb2R1Y2luZyBkaXN0cmFjdGlu
ZyBhbmQgcG9pbnRsZXNzIGNvbW1lbnRhcnksIGFuZAppbmFiaWxpdHkgdG8gYWRhcHQgdG8gZmVl
ZGJhY2suICBQbGVhc2UgZmVlbCBmcmVlIHRvIGFsc28gaWdub3JlIGVtYWlscwpmcm9tIHRoZW0u
Cgp0aGFua3MsCgpncmVnIGstaCdzIHBhdGNoIGVtYWlsIGJvdAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
