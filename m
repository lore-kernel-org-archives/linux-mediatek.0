Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B37C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfPNpXYGDQ1LVSYiqA6bY5fj0trJZze9PhsFAV/DCqI=; b=eSwFjVqL+E0IAW
	DrNhN3h1hTQYSoXlamNgM2Aq7xsV0o+QhNhHbNmm8kTkXRwyObq4Udz7Gx/8ttTssHQVbra7is34O
	sN2PAe/Ymv2GK/+NyuKz6KiCtFfrpjGmbRnMCffiUWUnCerDeU++/KaIM2MyVthjfcm0tqS86CReu
	PjqTAdvvk6/a2LQ3meM0kdAOfcgMlHNAhZ2SnehM2PvaDxmciSgmqECPr0juAiALnoKVZ+RMbZ/hb
	m+M8o9/YqLgzIjUKkEeGL6A/04xB4TMayRvMgnTL5u89W7vePchjp6ufzAosYTgzuxsIlQ7iee09D
	O6r4JeN2gtJDmNDRB3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXkPd-002ETE-2o; Fri, 25 Mar 2022 13:55:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXkPM-002EPu-NI; Fri, 25 Mar 2022 13:55:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8F99E1F462D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648216515;
 bh=cqBWFRODBQioJaru9o4N5RpABHoeodsNoNfLh0sHduc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S0abQe6xeVDmFRXZ3pzo7HAitzO23HAj9Vl0jicSCiBqMmrcNoc1MVRLrrEbXs3sH
 MenwgpmO2A0QUdiwBEfs5fT92dU9nXNmAckNiUiLJf5WxLFSH+gswHbZuoKVu8UGAv
 nT+xghOMz1XgbmpcfNQ8cSJJsdgIXhEU+PBh1dUPYYj7jpRMHZ/nnWyUO9PVx6JgLo
 fr+gPdBFIwkIaMHN27yWpPNwWtMSwLrICzj5ezHUpdaLuSfu/UDWV4iqO8y32JJPYl
 GGidz1UCD0Uq592UPYc6sNIJcPqVXymnnO1Pn8TnrdDu12jTjKS7xFvt240ihK8MIU
 f7O017ZrmbS5Q==
Message-ID: <a57af792-1eef-297c-176e-194757f3acc1@collabora.com>
Date: Fri, 25 Mar 2022 14:55:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 19/22] arm64: dts: mt8192: Add the mmsys reset bit to
 reset the dsi0
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-20-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318144534.17996-20-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_065516_959085_5BC184DC 
X-CRM114-Status: GOOD (  16.91  )
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

SWwgMTgvMDMvMjIgMTU6NDUsIEFsbGVuLUtIIENoZW5nIGhhIHNjcml0dG86Cj4gUmVzZXQgdGhl
IERTSSBoYXJkd2FyZSBpcyBuZWVkZWQgdG8gcHJldmVudCBkaWZmZXJlbnQgc2V0dGluZ3MgYmV0
d2Vlbgo+IHRoZSBib290bG9hZGVyIGFuZCB0aGUga2VybmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFsbGVuLUtIIENoZW5nIDxhbGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20+Cj4gQWNrZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gUmV2aWV3ZWQtYnk6IE7DrWNvbGFzIEYu
IFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KCk5vdGU6IHNpbmNlIHRoZXJl
IHdlcmUgc29tZSBtdGstbW1zeXMuYyB1cGRhdGVzIGluIHRoZSBtZWFud2hpbGUsIHRoaXMgcGF0
Y2gKcmVxdWlyZXMgWzFdIHRvIGJlIG1lcmdlZCBpbiBvcmRlciB0byB3b3JrIGNvcnJlY3RseS4K
CkFzaWRlIGZyb20gdGhhdDoKClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdu
byA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKClsxXTogCmh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDIy
MDMyMzA5MTkzMi4xMDY0OC0xLWFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bS8KCj4gLS0tCj4gICBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE5Mi1yZXNldHMuaCB8
IDMgKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTkyLXJlc2V0cy5oIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9yZXNldC9tdDgxOTItcmVzZXRzLmgKPiBpbmRleCBiZTlhN2NhMjQ1YjkuLjc2
NGNhOTkxMGZhOSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE5
Mi1yZXNldHMuaAo+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTkyLXJlc2V0
cy5oCj4gQEAgLTI3LDQgKzI3LDcgQEAKPiAgIAo+ICAgI2RlZmluZSBNVDgxOTJfVE9QUkdVX1NX
X1JTVF9OVU0JCQkJMjMKPiAgIAo+ICsvKiBNTVNZUyByZXNldHMgKi8KPiArI2RlZmluZSBNVDgx
OTJfTU1TWVNfU1cwX1JTVF9CX0RJU1BfRFNJMAkJCTE1Cj4gKwo+ICAgI2VuZGlmICAvKiBfRFRf
QklORElOR1NfUkVTRVRfQ09OVFJPTExFUl9NVDgxOTIgKi8KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
