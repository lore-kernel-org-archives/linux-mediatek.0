Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21491C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 00:31:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D76BB60FE6
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 00:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D76BB60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4fSRZ9DWXMMXdmtAzfg9WoTfEY8IJ9FGufbY9nlWbo=; b=1iTHXTooHDisXA
	xBifC6GOgOMLXjseAOGhOZqttLJYVOE9UXmpxLmCGDL6VxY++kQvbsrafO6/FQYg99nbQlWl+vbZY
	3U5AQS8ZMk8yZSh6nWOUQkeD8vKrh4I0gjCKaKAWMgsr1jFt5FayrxyZF9aie3XY6OWL/mxFfgYbN
	KqSayk5XCXYYYiRiSj3jaNCpC68YbZ3ydIOrEoGVn5DQ1dLHYQhWasig/toIZewsd0EiFJqhyLgCu
	JkKLqZBgeAXsDLIGhgvc29SCRC10B7SJ8ZeQ0ITydE57mZqI38FNVhfMmWW4H30LZ8ln2nenlzjGE
	E+5ENQ8xuhSlnhoFDKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ3Is-008n6H-0C; Thu, 26 Aug 2021 00:31:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ3If-008n4Z-QQ; Thu, 26 Aug 2021 00:31:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D067760FE6;
 Thu, 26 Aug 2021 00:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629937880;
 bh=XFk+aK01AY+R2dj58lCttstlbncJMKuBtfKozV0XaIk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QkYeFlxOalO8NtPJPM5RhBh8j7Vk2Zi/9UTqamt6lR1JmceRcWO1Uxcmj9AJYi2WL
 BfXUFl6Lh4/+LO6SPiNnWNR0T08/oUuWRQccKiGhq40Bw0pX5zYDYYmZHRVgUZQju1
 RYaIUmqxl1R6iWeI8/kYNwgVsw3GogsX9cX86tdiy7WCQI62kbTW6M10B9JTOTYmRE
 ZXLUVEbFSyEmiP2/JTA8qRcwzE7PlzW5Vuhf3imFCMVDFjcGuD9nNy/6erFSpI0OWv
 Z0YZmFtloHBVkgv7jaPurnVS4Tg6m5skjE085rnzXbw4M2kyZft8/o1Dwm55121Q2s
 3WhmWQENq/tzA==
Received: by mail-ed1-f49.google.com with SMTP id i6so1842819edu.1;
 Wed, 25 Aug 2021 17:31:20 -0700 (PDT)
X-Gm-Message-State: AOAM530+D2C+krcdW30BzPA81yPeF3r0vo5rmcZt3sFwi4fxgyCcpf8J
 MORBlyvu8czrEH2tzfwMN2/8+GHVggQP8YczLQ==
X-Google-Smtp-Source: ABdhPJxHrEFAQXvMGytASwC6d51UlxpmRysieIO6RqrSrlKKQl0Fvx1UuUCVLhd0YlH7mrdO+2L/kgf90DT6ck//90g=
X-Received: by 2002:aa7:ca04:: with SMTP id y4mr1341608eds.162.1629937879396; 
 Wed, 25 Aug 2021 17:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210825102632.601614-1-enric.balletbo@collabora.com>
 <20210825122613.v3.3.Ifec72a83f224b62f24cfc967edfe78c5d276b2e3@changeid>
In-Reply-To: <20210825122613.v3.3.Ifec72a83f224b62f24cfc967edfe78c5d276b2e3@changeid>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 26 Aug 2021 08:31:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9anqUZ-um4bP8Gzf4HZT5+j+yVpTq6pQzESpamrGLM8Q@mail.gmail.com>
Message-ID: <CAAOTY_9anqUZ-um4bP8Gzf4HZT5+j+yVpTq6pQzESpamrGLM8Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: display: mediatek: add dsi reset
 optional property
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jitao Shi <jitao.shi@mediatek.com>, 
 Eizan Miyamoto <eizan@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 DTML <devicetree@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_173121_925179_C69EE2FC 
X-CRM114-Status: GOOD (  16.81  )
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

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjHlubQ45pyIMjXml6Ug6YCx5LiJIOS4i+WNiDY6Mjblr6vpgZPvvJoK
Pgo+IFVwZGF0ZSBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHRoZSBkc2kg
dG8gYWRkIHRoZSBvcHRpb25hbAo+IHByb3BlcnR5IHRvIHJlc2V0IHRoZSBkc2kgY29udHJvbGxl
ci4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4K
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRi
b0Bjb2xsYWJvcmEuY29tPgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pgo+IC0tLQo+Cj4gKG5vIGNoYW5nZXMgc2luY2UgdjIpCj4KPiBDaGFuZ2VzIGluIHYyOgo+IC0g
QWRkZWQgYSBuZXcgcGF0Y2ggdG8gZGVzY3JpYmUgdGhlIGRzaSByZXNldCBvcHRpb25hbCBwcm9w
ZXJ0eS4KPgo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRzaS50eHQgICB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dAo+IGluZGV4IDgyMzhh
ODY2ODZiZS4uMzIwOWI3MDBkZWQ2IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkc2kudHh0Cj4gQEAgLTE5LDYgKzE5LDExIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gICAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dC4gVGhpcyBwb3J0IHNo
b3VsZCBiZSBjb25uZWN0ZWQKPiAgICB0byB0aGUgaW5wdXQgcG9ydCBvZiBhbiBhdHRhY2hlZCBE
U0kgcGFuZWwgb3IgRFNJLXRvLWVEUCBlbmNvZGVyIGNoaXAuCj4KPiArT3B0aW9uYWwgcHJvcGVy
dGllczoKPiArLSByZXNldHM6IGxpc3Qgb2YgcGhhbmRsZSArIHJlc2V0IHNwZWNpZmllciBwYWly
LCBhcyBkZXNjcmliZWQgaW4gWzFdLgo+ICsKPiArWzFdIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZXNldC9yZXNldC50eHQKPiArCj4gIE1JUEkgVFggQ29uZmlndXJhdGlvbiBN
b2R1bGUKPiAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Cj4gQEAgLTQ1LDYgKzUwLDcg
QEAgZHNpMDogZHNpQDE0MDFiMDAwIHsKPiAgICAgICAgIGNsb2NrcyA9IDwmbW1zeXMgTU1fRFNJ
MF9FTkdJTkU+LCA8Jm1tc3lzIE1NX0RTSTBfRElHSVRBTD4sCj4gICAgICAgICAgICAgICAgICA8
Jm1pcGlfdHgwPjsKPiAgICAgICAgIGNsb2NrLW5hbWVzID0gImVuZ2luZSIsICJkaWdpdGFsIiwg
ImhzIjsKPiArICAgICAgIHJlc2V0cyA9IDwmbW1zeXMgTVQ4MTczX01NU1lTX1NXMF9SU1RfQl9E
SVNQX0RTSTA+Owo+ICAgICAgICAgcGh5cyA9IDwmbWlwaV90eDA+Owo+ICAgICAgICAgcGh5LW5h
bWVzID0gImRwaHkiOwo+Cj4gLS0KPiAyLjMwLjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
