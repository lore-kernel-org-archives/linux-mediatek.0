From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH 00/20] unify mt76x2 and mt76x0 eeprom code
Date: Thu, 20 Sep 2018 14:40:07 +0200
Message-ID: <2589a3bd-85f8-ac73-9818-16020bb560ae@nbd.name>
References: <cover.1537433365.git.lorenzo.bianconi@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1537433365.git.lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 2018-09-20 11:11, Lorenzo Bianconi wrote:
> This series unify most of eeprom parsing between mt76x2 and
> mt76x0 driver. That patchset will be used to properly support
> mt76x0e chipsets without duplicating the code.
Merged patches 1-17. Transmit power handling will be unified in a
different way.

- Felix
