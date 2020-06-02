Return-Path: <SRS0=f9HX=7P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9A3C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 00:03:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D72C2072E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 00:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CWZFg7gk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXwBKN5f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D72C2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=886Z4y92H4oQNJPHDeKTMws5sPn/Sxus7ZLIEKrbtxc=; b=CWZFg7gkbREyVUOodHncg9pny
	J3SEkEL938dlTi2qJy/8IOpSVY0g2+E8WtLEr7Q6BvspEcJuiG2BNB3os8ljhw+4J8v4riSdazvlW
	Hz3OuULSZ9KvazwpWNtkkW8iT9gAhVI4vpkdCc8pxVqFCziRoOO27+XrAw9LQ4J/EWt6+Hi++5c4V
	ww+BROt/MPp7qjqRfRo/kB5zI8976j3UpJJUJhTz8PrgInG1yit4u1LvsNJpAy+kB5UI319JsprFr
	2C+8Q8/TEMT06biZ5CJPEi3yvvJK+/rZHvUDQlbOJXoQsaeegOxx1WwC5Kya11w84cOzhl4XJ0/fj
	koqXHWX2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfuOQ-00012H-1j; Tue, 02 Jun 2020 00:02:58 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfuOM-00010Y-Sf
 for linux-mediatek@lists.infradead.org; Tue, 02 Jun 2020 00:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591056171;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WEgguSwsSBQsO87++CE0y1rNffa4jp9PI1ZebsV4DLs=;
 b=VXwBKN5fbxKEnQk7tepgmnRafXsdL3DFCGVDZPAKPK1xSamLzs1wZQQHelY/dFcePVo22x
 2+G8JyoEcWt+Xn9G2vqFeIt9wNa++avI+NnFbchuvGdOL0xES6XvXeGnmCjveo2wUdeuJO
 /lOqhi2W6XkAyB03ZYoX/ckauGaqyM4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-R9a74eu4P22W5FHmcDRl0Q-1; Mon, 01 Jun 2020 20:02:39 -0400
X-MC-Unique: R9a74eu4P22W5FHmcDRl0Q-1
Received: by mail-qk1-f198.google.com with SMTP id l6so7394169qkk.14
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2020 17:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=WEgguSwsSBQsO87++CE0y1rNffa4jp9PI1ZebsV4DLs=;
 b=Oe2YgTs85LorMOXP+Q+qReWgFU/npam0MH/Yv4beEg0JI1S9Qu2sBMBxAqtOgXhHH1
 MiVWTld1u00zc+zBt4gW2rGb5AkHhBRXQyqf2e5/DchZjdozodIqk5BnN8lXkLtFp3eX
 J4NcuSJGUHC3DHZDlQFbhmMdiJFmext8YLFyy4iirZqNr+EY3NQJvkYadkQAv6cgAYto
 aIeE6ja4GsmIVwDycSYxnJtuJYbcxuN7BVrCiNDJoOA4D+NsvLsOjYqChr/1NsRThDR8
 HnDXIza7mFNjKJUT3PsMiDWrRvQrcLYbE6BRIOSNHpEqSTCns+k2KAzwc5nmoPZf0+k4
 Ss6w==
X-Gm-Message-State: AOAM531WRuH1LzpXhaBe7imHv8eGxR71ZO3BlJ9NC941kf5o87vm0OG8
 6BREE2TJaLPEWvMcMwvQVa/UO3WD+xlu29wJVmyrtGHIvuUWxs5zOmlNlmB5JpN+QxLMTUtSqgY
 ORp03n/+bhbzFT/JQNhgmZavSyJuz5IVO
X-Received: by 2002:ac8:724c:: with SMTP id l12mr23746258qtp.259.1591056159434; 
 Mon, 01 Jun 2020 17:02:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRFkXYMc6X8G+o56RMfYFp5n8699HmlGFcYOLIr9n0Jz/P369Z9v//wIL4kQ8Ioy89XjW8QQ==
X-Received: by 2002:ac8:724c:: with SMTP id l12mr23746213qtp.259.1591056159140; 
 Mon, 01 Jun 2020 17:02:39 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id t13sm852903qtc.77.2020.06.01.17.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 17:02:37 -0700 (PDT)
Date: Mon, 1 Jun 2020 17:02:36 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Message-ID: <20200602000236.j4m3jvluzdhjngdc@cantor>
Mail-Followup-To: Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200529221623.qc6twmpzryh7nkvb@cantor>
 <20200601104240.7f5xhz7gooqhaq4n@cantor>
 <47711845-98ee-95b8-aa95-423a36ed9741@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <47711845-98ee-95b8-aa95-423a36ed9741@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_170255_129533_E0E3F5B6 
X-CRM114-Status: GOOD (  13.32  )
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: Heiko Stuebner <heiko@sntech.de>, virtualization@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlIEp1biAwMiAyMCwgTHUgQmFvbHUgd3JvdGU6Cj5IaSBKZXJyeSwKPgo+T24gNi8xLzIw
IDY6NDIgUE0sIEplcnJ5IFNuaXRzZWxhYXIgd3JvdGU6Cj4+Pgo+Pj5IaSBKb2VyZywKPj4+Cj4+
PldpdGggdGhpcyBwYXRjaHNldCwgSSBoYXZlIGFuIGVweWMgc3lzdGVtIHdoZXJlIGlmIEkgYm9v
dCB3aXRoCj4+PmlvbW11PW5vcHQgYW5kIGZvcmNlIGEgZHVtcCBJIHdpbGwgc2VlIHNvbWUgaW8g
cGFnZSBmYXVsdHMgZm9yIGEgbmljCj4+Pm9uIHRoZSBzeXN0ZW0uIFRoZSB2bWNvcmUgaXMgaGFy
dmVzdGVkIGFuZCB0aGUgc3lzdGVtIHJlYm9vdHMuIEkKPj4+aGF2ZW4ndCByZXByb2R1Y2VkIGl0
IG9uIG90aGVyIHN5c3RlbXMgeWV0LCBidXQgd2l0aG91dCB0aGUgcGF0Y2hzZXQgSQo+Pj5kb24n
dCBzZWUgdGhlIGlvIHBhZ2UgZmF1bHRzIGR1cmluZyB0aGUga2R1bXAuCj4+Pgo+Pj5SZWdhcmRz
LAo+Pj5KZXJyeQo+Pgo+PkkganVzdCBoaXQgYW4gaXNzdWUgb24gYSBzZXBhcmF0ZSBpbnRlbCBi
YXNlZCBzeXN0ZW0gKGtkdW1wIGlvbW11PW5vcHQpLAo+PndoZXJlIGl0IHBhbmljcyBpbiBkdXJp
bmcgaW50ZWxfaW9tbXVfYXR0YWNoX2RldmljZSwgaW4gaXNfYXV4X2RvbWFpbiwKPj5kdWUgdG8g
ZGV2aWNlX2RvbWFpbl9pbmZvIGJlaW5nIERFRkVSX0RFVklDRV9ET01BSU5fSU5GTy4gVGhhdCBk
b2Vzbid0Cj4+Z2V0IHNldCB0byBhIHZhbGlkIGFkZHJlc3MgdW50aWwgdGhlIGRvbWFpbl9hZGRf
ZGV2X2luZm8gY2FsbC4KPj4KPj5JcyBpdCBhcyBzaW1wbGUgYXMgdGhlIGZvbGxvd2luZz8KPgo+
SSBndWVzcyB5b3Ugd29uJ3QgaGl0IHRoaXMgaXNzdWUgaWYgeW91IHVzZSBpb21tdS9uZXh0IGJy
YW5jaCBvZiBKb2VyZydzCj50cmVlLiBXZSd2ZSBjaGFuZ2VkIHRvIHVzZSBhIGdlbmVyaWMgaGVs
cGVyIHRvIHJldHJpZXZlIHRoZSB2YWxpZCBwZXIKPmRldmljZSBpb21tdSBkYXRhIG9yIE5VTEwg
KGlmIHRoZXJlJ3Mgbm8pLgo+Cj5CZXN0IHJlZ2FyZHMsCj5iYW9sdQo+CgpZZWFoLCB0aGF0IHdp
bGwgc29sdmUgdGhlIHBhbmljLiAKCj4+Cj4+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW50
ZWwtaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwtaW9tbXUuYwo+PmluZGV4IDI5ZDM5NDA4
NDdkMy4uZjFiYmVlZDQ2YTRjIDEwMDY0NAo+Pi0tLSBhL2RyaXZlcnMvaW9tbXUvaW50ZWwtaW9t
bXUuYwo+PisrKyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwtaW9tbXUuYwo+PkBAIC01MDUzLDggKzUw
NTMsOCBAQCBpc19hdXhfZG9tYWluKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IAo+PmlvbW11
X2RvbWFpbiAqZG9tYWluKQo+PiDCoHsKPj4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRldmljZV9k
b21haW5faW5mbyAqaW5mbyA9IGRldi0+YXJjaGRhdGEuaW9tbXU7Cj4+Cj4+LcKgwqDCoMKgwqDC
oCByZXR1cm4gaW5mbyAmJiBpbmZvLT5hdXhkX2VuYWJsZWQgJiYKPj4twqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tYWluLT50eXBlID09IElPTU1VX0RPTUFJ
Tl9VTk1BTkFHRUQ7Cj4+K8KgwqDCoMKgwqDCoCByZXR1cm4gaW5mbyAmJiBpbmZvICE9IERFRkVS
X0RFVklDRV9ET01BSU5fSU5GTyAmJgo+PivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlu
Zm8tPmF1eGRfZW5hYmxlZCAmJiBkb21haW4tPnR5cGUgPT0gCj4+SU9NTVVfRE9NQUlOX1VOTUFO
QUdFRDsKPj4gwqB9Cj4+Cj4+IMKgc3RhdGljIHZvaWQgYXV4aWxpYXJ5X2xpbmtfZGV2aWNlKHN0
cnVjdCBkbWFyX2RvbWFpbiAqZG9tYWluLAo+Pgo+Pgo+PlJlZ2FyZHMsCj4+SmVycnkKPl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj5pb21tdSBtYWlsaW5n
IGxpc3QKPmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCj5odHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
